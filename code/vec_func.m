T = readtable('../ProblemCDATA/data_filtered.csv',...
    'TreatAsEmpty',{'','NULL','PrivacySuppressed'});
Data = T(:,{'UNITID','SAT_AVG','UGDS','GRAD_DEBT_MDN_SUPP', ...
    'GRAD_DEBT_MDN10YR_SUPP','C150_4_POOLED_SUPP','C200_L4_POOLED_SUPP',...
    'NPT41_PUB', 'NPT42_PUB', 'NPT43_PUB','NPT44_PUB',...
    'NPT45_PUB','NPT41_PRIV','NPT42_PRIV','NPT43_PRIV',...
    'NPT44_PRIV','NPT45_PRIV','RET_FT4','RET_FTL4','RET_PT4','RET_PTL4'});

% Merge two variable columns
Data.NPT41 = fix_nan(Data.NPT41_PUB, Data.NPT41_PRIV);
Data.NPT41_PRIV = []; Data.NPT41_PUB = [];
Data.NPT42 = fix_nan(Data.NPT42_PUB, Data.NPT42_PRIV);
Data.NPT42_PRIV = []; Data.NPT42_PUB = [];
Data.NPT43 = fix_nan(Data.NPT43_PUB, Data.NPT43_PRIV);
Data.NPT43_PRIV = []; Data.NPT43_PUB = [];
Data.NPT44 = fix_nan(Data.NPT44_PUB, Data.NPT44_PRIV);
Data.NPT44_PRIV = []; Data.NPT44_PUB = [];
Data.NPT45 = fix_nan(Data.NPT45_PUB, Data.NPT45_PRIV);
Data.NPT45_PRIV = []; Data.NPT45_PUB = [];

Data.COMRATE = fix_nan(Data.C150_4_POOLED_SUPP, Data.C200_L4_POOLED_SUPP);
Data.C150_4_POOLED_SUPP = []; Data.C200_L4_POOLED_SUPP = [];
Data.FULLRENT = fix_nan(Data.RET_FT4, Data.RET_FTL4);
Data.RET_FT4 = []; Data.RET_FTL4 = [];
Data.PARTRENT = fix_nan(Data.RET_PT4, Data.RET_PTL4);
Data.RET_PT4 = []; Data.RET_PTL4 = [];
