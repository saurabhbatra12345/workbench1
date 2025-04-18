   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 14Apr2025:21:55:21
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
   array _beta_0_0_{16} _temporary_ (    3.69226467001024
          -0.14327726343068
          -0.06369685350159
          -0.26351113281707
           0.05443186985058
          -0.01604229160042
           0.40426319450827
          -0.01222687263612
           8.75382966682447
          -8.75382966682458
          -5.76535934229461
           5.76535934229465
          -3.83420601510563
           3.83420601510562
           1.56277754334914
           -0.2302550080148);
   array _xtmp_0_0_{17} _temporary_;
   array _xcomp_0_0_{17} _temporary_;
   array _xclas_0_0_{17} _temporary_;

   length _current_delinquency_status_ $14; drop _current_delinquency_status_;
   _current_delinquency_status_ = left(trim(put(current_delinquency_status,$14.)));
   length _family_size_g_ $2; drop _family_size_g_;
   _family_size_g_ = left(trim(put(family_size_g,$2.)));
   length _ctmp_0_ $3; drop _ctmp_0_;
   _ctmp_0_ = left(trim(put(ever_30_plus_dpd_in_last_12m,$3.)));
   length _max_delinquency_in_last_6m_ $2; drop _max_delinquency_in_last_6m_;
   _max_delinquency_in_last_6m_ = left(trim(put(max_delinquency_in_last_6m,$2.)));
   if missing(years_of_service)
      or missing(customer_age)
      or missing(outstanding_amt_to_gross_amt)
      or missing(casa_balance_to_emi_ratio_6m)
      or missing(salary_to_emi)
      or missing(length_of_relationship)
      or missing(num_loans_all_product_category)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 16; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 17; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 17; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 17; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _xtmp_0_0_[2] = casa_balance_to_emi_ratio_6m;

   _xtmp_0_0_[3] = customer_age;

   _xtmp_0_0_[4] = salary_to_emi;

   _xtmp_0_0_[5] = num_loans_all_product_category;

   _xtmp_0_0_[6] = length_of_relationship;

   _xtmp_0_0_[7] = outstanding_amt_to_gross_amt;

   _xtmp_0_0_[8] = years_of_service;

   _temp_ = 1;
   select (_current_delinquency_status_);
      when ('Delinquent') _xtmp_0_0_[9] = _temp_;
      when ('Not Delinquent') _xtmp_0_0_[10] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_ctmp_0_);
      when ('No') _xtmp_0_0_[11] = _temp_;
      when ('Yes') _xtmp_0_0_[12] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_max_delinquency_in_last_6m_);
      when ('0') _xtmp_0_0_[13] = _temp_;
      when ('>0') _xtmp_0_0_[14] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   _temp_ = 1;
   select (_family_size_g_);
      when ('0') _xtmp_0_0_[15] = _temp_;
      when ('1') _xtmp_0_0_[16] = _temp_;
      when ('>1') _xtmp_0_0_[17] = _temp_;
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
   do _j_=1 to 1; _xrow_0_0_{_j_+14} = _xtmp_0_0_{_j_+14}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+15} = _xtmp_0_0_{_j_+16}; end;

   do _i_=1 to 16;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_event $12;
   label I_event = 'Into: event';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_event = 'Predicted: event';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_event = 1 / (1+exp(-_linp_));
      end; else do;
         P_event = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_event >= 0.5                  then do;
         I_event = _levels_0_{1};
      end; else do;
         I_event = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_event = .;
      I_event = ' ';
   end;


