
% Build a Table for stats analysis from data0621-3.mat (used by davidellipse_original).
% Each row = one ethnicity group (25 samples) × one CCT (5 lights) -> 20 rows.
%
% Fixed fields per your request:
% - 数据库来源: 'Summer ' + 'Haisi skin - Test experiment'
% - 照度: '1000lx'
% - 模特编号: 'Nan'
% - 观察者类型: 'Asian'
% - opinion_score范围: '0-1(compulsory choice)'
% - 景别: 'inLab'

  
  thisDir  = fileparts(mfilename('fullpath'));
  dataFile = fullfile(thisDir, '..', '2. Code', 'data0621-3.mat');
  

  S = load(dataFile);
  assert(isfield(S,'a') && isfield(S,'b'), 'MAT must contain variables ''a'' (500×Nobs) and ''b'' (100×3).');
  A = S.a;  % 500×Nobs, 100*5 stacked (each 25 is one ethnicity group)
  B = S.b;  % 100×3 Lab

  % Mean opinion over observers, reshape to 100×5 (5 CCT)
  cMean = mean(A, 2, 'omitnan');    % 500×1
  try
      cMean = reshape(cMean, 100, 5);
  catch
      error('Size mismatch: ''a'' must be (100*5)×Nobserver so that mean(a,2) reshapes to 100×5.');
  end

  % Labels and constants
  datasetStr = "Haisi skin - Test experiment";
  srcPrefix  = "Summer ";
  cctList    = [3000 4000 5000 6500 8000];
  lightStrs  = string(cctList) + "K";
  ethList    = {'African','Caucasian','Oriental','South Asian'};
  nEth = 4; nCCT = 5; nRows = nEth * nCCT;

  % Preallocate columns
  srcCol       = repmat(srcPrefix + datasetStr, nRows, 1);
  labListCol   = cell(nRows,1);
  opinListCol  = cell(nRows,1);
  labCtrCol    = zeros(nRows,3);
  labAvgCol    = zeros(nRows,3);
  cctCol       = zeros(nRows,1);
  illCol       = repmat("1000lx", nRows, 1);
  sceneCol     = repmat("inLab", nRows, 1);
  lightCol     = strings(nRows,1);
  dCol         = repmat("no CAT", nRows, 1);
  ethCol       = strings(nRows,1);
  modelIdCol   = repmat("Nan", nRows, 1);
  obsTypeCol   = repmat("Asian", nRows, 1);
  opinRangeCol = repmat("0-1(compulsory choice)", nRows, 1);

  row = 0;
  for j = 1:nEth
      idxGroup = (25*(j-1)+1) : (25*j);   % 25 stimuli indices for ethnicity j
      LabList0 = B(idxGroup, :);          % 25×3
      labAvg   = mean(LabList0, 1, 'omitnan');  % 1×3

      for i = 1:nCCT
          row = row + 1;
          scores = cMean(idxGroup, i);    % 25×1

          % Weighted Lab center using opinion scores; fallback to unweighted mean
          w = scores; w(isnan(w)) = 0;
          if sum(w) > 0
              labCtr = sum(LabList0 .* w, 1) / sum(w);
          else
              labCtr = labAvg;
          end

          % Fill row
          labListCol{row}  = LabList0;
          opinListCol{row} = scores;
          labCtrCol(row,:) = labCtr;
          labAvgCol(row,:) = labAvg;
          cctCol(row)      = cctList(i);
          lightCol(row)    = lightStrs(i);
          dCol(row)        = "no CAT";
          ethCol(row)      = string(ethList{j});
      end
  end

  % Assemble table with requested column names
  T = table( ...
      srcCol,           labListCol,   opinListCol, ...
      labCtrCol,        labAvgCol,    cctCol, ...
      illCol,           sceneCol,     lightCol, ...
      dCol,             ethCol,       modelIdCol, ...
      obsTypeCol,       opinRangeCol, ...
      'VariableNames', { ...
        '数据库来源', 'N个渲染图像Lab值', 'N个opinion_score', ...
        'Lab_center',  'average_Lab', 'CCT', ...
        '照度',        '景别',        '建模时光源', ...
        'D公式',       '模特人种',    '模特编号', ...
        '观察者类型',  'opinion_score范围' ...
      } ...
  );

  % Optional: quick preview
  disp(T(1:min(5,height(T)), :));

