%% Converted from John Kruschke's HDIofMCMC function
% 
%
%                           - Hyungwook Yim 2016/12/27
%
%%%%% Here is a description from JK's code
% Computes highest density interval from a sample of representative values,
%   estimated as shortest credible interval.
% Arguments:
%   sampleVec
%     is a vector of representative values from a probability distribution.
%   credMass
%     is a scalar between 0 and 1, indicating the mass within the credible
%     interval that is to be estimated.
% Value:
%   HDIlim is a vector containing the limits of the HDI
%
%

function HDIlim = calHDI(sampleVec, credMass)
    if nargin < 2
        credMass=.95;
    end;
    sortedPts = sort(sampleVec);
    ciIdxInc = floor(credMass*length(sortedPts));
    nCIs = length(sortedPts) - ciIdxInc;
    ciWidth = zeros(1, nCIs);
    for i = 1:nCIs
        ciWidth(i) = sortedPts(i + ciIdxInc) - sortedPts(i);
    end;
    [minVal, minPos] = min(ciWidth);
    HDImin = sortedPts(minPos);
    HDImax = sortedPts(minPos+ciIdxInc);
    HDIlim = [HDImin HDImax];

