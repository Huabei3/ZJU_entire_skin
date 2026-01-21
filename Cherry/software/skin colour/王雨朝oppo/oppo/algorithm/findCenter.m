function center = findCenter(L)
% Input parameter:
%     L - Lightness value;
% Output parameter:
%     [ac bc] - coordinates a* b* of preferred center
%               in a-b plane.

z5 = -0.001319 * L + 0.635;
z6 = -0.05144 * L + 4.034;
z8 = -0.01203 * L + 1.216;
z9 = -0.03396 * L + 2.881;

ab = [13.69,19.66; 12.31,16.02; 16.62,18.55; 15.24,14.91];

ac = (z5.*ab(1,1) + z6.*ab(2,1) + z8.*ab(3,1) + z9.*ab(4,1)) ./ (z5+z6+z8+z9);
bc = (z5.*ab(1,2) + z6.*ab(2,2) + z8.*ab(3,2) + z9.*ab(4,2)) ./ (z5+z6+z8+z9);

center = [ac,bc];

end