function c = contrast(imgname)

[djg,dcg] = contrast_global(imgname);

[djl,dcl] = contrast_local(imgname);

c = 0.0071 * djg + 0.0257 * dcg + 0.0001 * djl + 0.0023 * dcl;