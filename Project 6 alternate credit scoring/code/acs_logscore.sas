   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 15Apr2025:16:47:36
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_0_0_{13} _temporary_;
   array _beta_0_0_{13} _temporary_ (   -3.49590234268883
           0.00238932660981
           0.00139270427476
           0.00195196055877
           -0.1097802398254
           0.02325099686479
           0.70099898462722
           -0.5162993393063
          -1.84216226056134
           0.84581114996147
          -0.84581114996147
           0.20028958786957
          -0.42367046208867);
   array _xtmp_0_0_{14} _temporary_;
   array _xcomp_0_0_{14} _temporary_;
   array _xclas_0_0_{14} _temporary_;

   length _asl_flag_ $1; drop _asl_flag_;
   _asl_flag_ = left(trim(put(asl_flag,$1.)));
   length _new_cell_ $1; drop _new_cell_;
   _new_cell_ = left(trim(put(new_cell,$1.)));
   if missing(ovrmou_Mean)
      or missing(months)
      or missing(eqpdays)
      or missing(rat6avg)
      or missing(custcare_Mean)
      or missing(rat36avg)
      or missing(rev_Mean)
      or missing(rat3avg)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 13; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 14; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 14; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 14; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _xtmp_0_0_[2] = ovrmou_Mean;

   _xtmp_0_0_[3] = rev_Mean;

   _xtmp_0_0_[4] = eqpdays;

   _xtmp_0_0_[5] = months;

   _xtmp_0_0_[6] = custcare_Mean;

   _xtmp_0_0_[7] = rat3avg;

   _xtmp_0_0_[8] = rat36avg;

   _xtmp_0_0_[9] = rat6avg;

   _temp_ = 1;
   select (_asl_flag_);
      when ('N') _xtmp_0_0_[10] = _temp_;
      when ('Y') _xtmp_0_0_[11] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_new_cell_);
      when ('N') _xtmp_0_0_[12] = _temp_;
      when ('U') _xtmp_0_0_[13] = _temp_;
      when ('Y') _xtmp_0_0_[14] = _temp_;
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
   do _j_=1 to 1; _xrow_0_0_{_j_+12} = _xtmp_0_0_{_j_+13}; end;

   do _i_=1 to 13;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_default $12;
   label I_default = 'Into: default';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_default = 'Predicted: default';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_default = 1 / (1+exp(-_linp_));
      end; else do;
         P_default = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_default >= 0.5                  then do;
         I_default = _levels_0_{1};
      end; else do;
         I_default = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_default = .;
      I_default = ' ';
   end;


