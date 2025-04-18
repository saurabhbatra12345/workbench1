   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 14Mar2025:16:10:26
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_0_0_{16} _temporary_;
   array _beta_0_0_{16} _temporary_ (   -3.42278710165825
          -0.01279653094246
          -0.05132220191003
           0.00001700461047
           0.75703975324561
           4.83906330843652
          -0.95684987385785
           0.17500577494474
          -1.17841525130315
           0.33696643854825
          -0.67888703301804
           0.67888703301804
          -1.92482210782333
           1.92482210782378
          -0.41832797807224
           0.41832797807223);
   array _xtmp_0_0_{21} _temporary_;
   array _xcomp_0_0_{21} _temporary_;
   array _xclas_0_0_{21} _temporary_;

   length _Age_edu_postgr_flag_ $1; drop _Age_edu_postgr_flag_;
   _Age_edu_postgr_flag_ = left(trim(put(Age_edu_postgr_flag,$1.)));
   length _education_ $13; drop _education_;
   _education_ = left(trim(put(education,$13.)));
   length _low_ed_high_inc_ $1; drop _low_ed_high_inc_;
   _low_ed_high_inc_ = left(trim(put(low_ed_high_inc,$1.)));
   length _account_type_ $10; drop _account_type_;
   _account_type_ = left(trim(put(account_type,$10.)));
   length _Target_IBAN_Dig_acc_ $1; drop _Target_IBAN_Dig_acc_;
   _Target_IBAN_Dig_acc_ = left(trim(put(Target_IBAN_Dig_acc,$1.)));
   if missing(avg_time_cr_tx_60_days)
      or missing(total_cr_amt_30_days)
      or missing(customer_relation_time_months)
      or missing(num_unq_rx_90_days)
      or missing(ratio_cr_30to90_days)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 16; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 21; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 21; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 21; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _xtmp_0_0_[3] = customer_relation_time_months;

   _xtmp_0_0_[4] = avg_time_cr_tx_60_days;

   _xtmp_0_0_[5] = total_cr_amt_30_days;

   _xtmp_0_0_[6] = num_unq_rx_90_days;

   _xtmp_0_0_[7] = ratio_cr_30to90_days;

   _temp_ = 1;
   select (_account_type_);
      when ('companies') _xtmp_0_0_[10] = _temp_;
      when ('govt') _xtmp_0_0_[11] = _temp_;
      when ('individual') _xtmp_0_0_[12] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_education_);
      when ('Graduate') _xtmp_0_0_[13] = _temp_;
      when ('High School') _xtmp_0_0_[14] = _temp_;
      when ('Post Graduate') _xtmp_0_0_[15] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_Target_IBAN_Dig_acc_);
      when ('N') _xtmp_0_0_[16] = _temp_;
      when ('Y') _xtmp_0_0_[17] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_Age_edu_postgr_flag_);
      when ('N') _xtmp_0_0_[18] = _temp_;
      when ('Y') _xtmp_0_0_[19] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_low_ed_high_inc_);
      when ('N') _xtmp_0_0_[20] = _temp_;
      when ('Y') _xtmp_0_0_[21] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   do _j_=1 to 1; _xrow_0_0_{_j_+0} = _xtmp_0_0_{_j_+0}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+1} = _xtmp_0_0_{_j_+2}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+2} = _xtmp_0_0_{_j_+3}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+3} = _xtmp_0_0_{_j_+4}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+4} = _xtmp_0_0_{_j_+5}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+5} = _xtmp_0_0_{_j_+6}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+6} = _xtmp_0_0_{_j_+10}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+7} = _xtmp_0_0_{_j_+11}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+8} = _xtmp_0_0_{_j_+12}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+9} = _xtmp_0_0_{_j_+13}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+10} = _xtmp_0_0_{_j_+15}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+11} = _xtmp_0_0_{_j_+16}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+12} = _xtmp_0_0_{_j_+17}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+13} = _xtmp_0_0_{_j_+18}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+14} = _xtmp_0_0_{_j_+19}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+15} = _xtmp_0_0_{_j_+20}; end;

   do _i_=1 to 16;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_fraud_flag $12;
   label I_fraud_flag = 'Into: fraud_flag';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_fraud_flag = 'Predicted: fraud_flag';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_fraud_flag = 1 / (1+exp(-_linp_));
      end; else do;
         P_fraud_flag = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_fraud_flag >= 0.5                  then do;
         I_fraud_flag = _levels_0_{1};
      end; else do;
         I_fraud_flag = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_fraud_flag = .;
      I_fraud_flag = ' ';
   end;


