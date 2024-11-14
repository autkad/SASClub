%let startyear=2001;
%let currentyear=2024;






data Releases;
  format Date DATE7.;
  input Category $8. Release $7. Date DATE9. Details $15.;
  datalines;
Ancient 1.0    01Nov1999 SAS 8.0
Ancient 1.1    01Jul2000 SAS 8.1
Ancient 1.2    01Apr2001 SAS 8.2
Ancient 1.3    01Sep2001 
Ancient 2.0    01Sep2002 
Ancient 2.05   01May2003 SAS 9.0
Ancient 2.1    01Apr2004 SAS 9.1
Ancient 3.0    01May2004 .NET rewrite
Ancient 3.02   01Feb2005 remaster/L10N
Ancient 4.1    01Mar2006 
Ancient 4.1v   01Apr2007 Vista
Ancient 4.2    01Mar2009 SAS 9.2
Ancient 4.22   01Sep2009 SAS 9.2m2
Old     4.3    01Aug2010
Old     4.305l 01Sep2010 L10N
Old     4.305r 01Jul2011 SAS 9.3
Old     5.1    01Feb2012
Old     6.1    01Jul2013 SAS 9.4
Old     7.1    01Oct2014 
Old     7.11   01May2015
Old     7.12   01Feb2016
Old     7.13   01Nov2016 SAS 9.4m4
Recent  7.15   01Sep2017 SAS 9.4m5
Recent  8.1    01Jun2019 Redesign
Recent  8.2    01Nov2019
Recent  8.3    18Aug2020 SAS 9.4m7
Recent  8.4    19Mar2024 SAS Viya
;
run;










 
/* running in SAS EG - modify active ODS to add title to graph */
ods html5(id=eghtml) style=htmlencore gtitle;
 
ods graphics / height=850 width=1300 ;
title font="Anova" height=2.2 color=cx0766D1 
  "SAS Enterprise Guide Releases (&startyear - &currentyear)";




proc sgplot data=Releases noautolegend;
  styleattrs datacolors=(cxC4DEFD cxFFCC33 cx4398F9);
  block x=date block=category / transparency = 0.75 
     valueattrs=(weight=bold size=14pt color=navy 
      family='Anova');
  scatter x=date y=release / datalabel=Details 
    datalabelpos=topleft dataskin=matte
    datalabelattrs=(size=10pt weight=bold Family="Anova")
    markerattrs=(symbol=CircleFilled color=cxFF66B2 size=14);
  xaxis grid type=time offsetmax=0.1 offsetmin=0 valueattrs=(Family="Anova") 
        ranges=('01Jan1997'd-'01Jan2025'd) display=(nolabel) ;
  yaxis type=discrete grid offsetmax=0.1 valueattrs=(Family="Anova")
    label="Release/Event" labelattrs=(Family="Anova");
  inset "Updated &SYSDATE9." / 
     textattrs=(weight=bold) position=bottomright;
run;



