   /*---------------------------------------------------------
     Generated SAS Scoring Code
     Date: 25Feb2025:22:51:54
     -------------------------------------------------------*/

   drop _badval_ _linp_ _temp_ _i_ _j_;
   _badval_ = 0;
   _linp_   = 0;
   _temp_   = 0;
   _i_      = 0;
   _j_      = 0;
   drop MACLOGBIG;
   MACLOGBIG= 7.0978271289338392e+02;

   array _xrow_0_0_{5} _temporary_;
   array _beta_0_0_{5} _temporary_ (   -4.36139978793723
           0.62271722221355
           0.00509870196857
           1.11952756303221
          -1.32195615878519);
   array _xtmp_0_0_{32} _temporary_;
   array _xcomp_0_0_{32} _temporary_;
   array _xclas_0_0_{32} _temporary_;

   length _loc_group_ $12; drop _loc_group_;
   _loc_group_ = left(trim(put(loc_group,$12.)));
   if missing(dti)
      or missing(num_tl_90g_dpd_24m)
      then do;
         _badval_ = 1;
         goto skip_0_0;
   end;

   do _i_=1 to 5; _xrow_0_0_{_i_} = 0; end;
   do _i_=1 to 32; _xtmp_0_0_{_i_} = 0; end;
   do _i_=1 to 32; _xcomp_0_0_{_i_} = 0; end;
   do _i_=1 to 32; _xclas_0_0_{_i_} = 0; end;

   _xtmp_0_0_[1] = 1;

   _xtmp_0_0_[3] = num_tl_90g_dpd_24m;

   _xtmp_0_0_[4] = dti;

   _temp_ = 1;
   select (_loc_group_);
      when ('high_tgt_loc') _xtmp_0_0_[30] = _temp_;
      when ('low_tgt_loc') _xtmp_0_0_[31] = _temp_;
      when ('med_tgt_loc') _xtmp_0_0_[32] = _temp_;
      otherwise do; _badval_ = 1; goto skip_0_0; end;
   end;

   do _j_=1 to 1; _xrow_0_0_{_j_+0} = _xtmp_0_0_{_j_+0}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+1} = _xtmp_0_0_{_j_+2}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+2} = _xtmp_0_0_{_j_+3}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+3} = _xtmp_0_0_{_j_+29}; end;
   do _j_=1 to 1; _xrow_0_0_{_j_+4} = _xtmp_0_0_{_j_+30}; end;

   do _i_=1 to 5;
      _linp_ + _xrow_0_0_{_i_} * _beta_0_0_{_i_};
   end;

   skip_0_0:
   length I_tgt_1 $12;
   label I_tgt_1 = 'Into: tgt_1';
   array _levels_0_{2} $ 12 _TEMPORARY_ ('1'
   ,'0'
   );
   label P_tgt_1 = 'Predicted: tgt_1';
   if (_badval_ eq 0) and not missing(_linp_) then do;
      if (_linp_ > 0) then do;
         P_tgt_1 = 1 / (1+exp(-_linp_));
      end; else do;
         P_tgt_1 = exp(_linp_) / (1+exp(_linp_));
      end;
      if P_tgt_1 >= 0.5                  then do;
         I_tgt_1 = _levels_0_{1};
      end; else do;
         I_tgt_1 = _levels_0_{2};
      end;
   end; else do;
      _linp_ = .;
      P_tgt_1 = .;
      I_tgt_1 = ' ';
   end;


