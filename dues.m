clear;

%% Indexed Persons : 
%   1 yzh
%   2 zlf
%   3 cdl
%   4 lw
%   5 czy

%% Financial Elements : 
%   the indexed person on a line is the creditor
%   the indexed person on a column is the debiter
%   
%   illumination :
%   [the 'debiter' owes the 'creditor' some amount of money, and should
%   return it]

%% Balance Sheet
balanceSheet = accountStatement();

%% Settlement Process

% deletinzg ringssum
rings = findRings(balanceSheet);

while(numel(rings)>0)
    balanceSheet = deletePath(balanceSheet,rings(1,:));   
    
    rings = findRings(balanceSheet);
end

% deleting correspondance 

correspondance = findCorrespondance(balanceSheet);

while(numel(correspondance)>0)
    balanceSheet = deleteCorrespondance(balanceSheet,correspondance(1,:));
    
    correspondance = findCorrespondance(balanceSheet);
end

balanceSheet