   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 04Apr2025:17:32:15
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_0_0_{14} _temporary_;
   array _beta_0_0_{14} _temporary_ (   -47.4766539395627
           0.36419722556908
           3.14560360175799
           3.83250665289199
           0.00021964448771
           3.95433108244398
          -0.03644591660519
          -0.00001048345656
          -0.00028345286292
          -0.05228992412947
           5.39774848005586
            0.0003014726001
           0.53415909110745
          -0.20323751265753);
   array _xtmp_0_0_{15} _temporary_;
   array _xcomp_0_0_{15} _temporary_;
   array _xclas_0_0_{15} _temporary_;

   length _home_ownership_ $8; drop _home_ownership_;
   _home_ownership_ = left(trim(put(home_ownership,$8.)));
   if missing(annual_inc)
      or missing(Hard_Inquiries)
      or missing(Significant_Drop_in_Savings)
      or missing(Total_Outstanding_Debt)
      or missing(Debt_to_Income_Ratio)
      or missing(Change_in_FICO_Score)
      or missing(Loan_Deferrals)
      or missing(Missed_Payments)
      or missing(LOR)
      or missing(Age)
      or missing(Change_in_Employment_Status)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 14; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 15; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 15; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 15; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _xtmp_0_0_[2] = Debt_to_Income_Ratio;

   _xtmp_0_0_[3] = Hard_Inquiries;

   _xtmp_0_0_[4] = Missed_Payments;

   _xtmp_0_0_[5] = Total_Outstanding_Debt;

   _xtmp_0_0_[6] = Loan_Deferrals;

   _xtmp_0_0_[7] = Change_in_FICO_Score;

   _xtmp_0_0_[8] = annual_inc;

   _xtmp_0_0_[9] = LOR;

   _xtmp_0_0_[10] = Age;

   _xtmp_0_0_[11] = Change_in_Employment_Status;

   _xtmp_0_0_[12] = Significant_Drop_in_Savings;

   _temp_ = 1;
   select (_home_ownership_);
      when ('MORTGAGE') _xtmp_0_0_[13] = _temp_;
      when ('OWN') _xtmp_0_0_[14] = _temp_;
      when ('RENT') _xtmp_0_0_[15] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   do _j_=1 to 1; _xrow_0_0_{_j_+0} = _xtmp_0_0_{_j_+0}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+1} = _xtmp_0_0_{_j_+1}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+2} = _xtmp_0_0_{_j_+2}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+3} = _xtmp_0_0_{_j_+3}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+4} = _xtmp_0_0_{_j_+4}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+5} = _xtmp_0_0_{_j_+5}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+6} = _xtmp_0_0_{_j_+6}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+7} = _xtmp_0_0_{_j_+7}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+8} = _xtmp_0_0_{_j_+8}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+9} = _xtmp_0_0_{_j_+9}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+10} = _xtmp_0_0_{_j_+10}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+11} = _xtmp_0_0_{_j_+11}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+12} = _xtmp_0_0_{_j_+12}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+13} = _xtmp_0_0_{_j_+13}; end;

   do _i_=1 to 14;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_Early_Warning_Event $12;
   label I_Early_Warning_Event = 'Into: Early_Warning_Event';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_Early_Warning_Event = 'Predicted: Early_Warning_Event';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_Early_Warning_Event = 1 / (1+exp(-_linp_));
      end; else do;
         P_Early_Warning_Event = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_Early_Warning_Event >= 0.5                  then do;
         I_Early_Warning_Event = _levels_0_{1};
      end; else do;
         I_Early_Warning_Event = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_Early_Warning_Event = .;
      I_Early_Warning_Event = ' ';
   end;


