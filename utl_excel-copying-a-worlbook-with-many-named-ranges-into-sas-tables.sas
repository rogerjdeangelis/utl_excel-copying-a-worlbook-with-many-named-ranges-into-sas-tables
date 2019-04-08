Copying an excel workbook with many named ranges into SAS tables                                             
                                                                                                             
SAS Forum                                                                                                    
http://tinyurl.com/y27nkcls                                                                                  
https://communities.sas.com/t5/SAS-Programming/import-multiple-Excel-sheets-into-SAS/m-p/549131              
                                                                                                             
*_                   _                                                                                       
(_)_ __  _ __  _   _| |_                                                                                     
| | '_ \| '_ \| | | | __|                                                                                    
| | | | | |_) | |_| | |_                                                                                     
|_|_| |_| .__/ \__,_|\__|                                                                                    
        |_|                                                                                                  
;                                                                                                            
                                                                                                             
* create an excel workbook with three named ranges and three tabs;                                           
* Yoy can have mutiple 'named ranges in the same tab;;                                                       
                                                                                                             
%utlfkil(d:/xls/multiple_named_ranges.xlsx);                                                                 
libname xel "d:/xls/multiple_named_ranges.xlsx" ;                                                            
                                                                                                             
data  xel.name   (keep=name age)                                                                             
      xel.sexhgt (keep=sex height)                                                                           
      xel.sexwgt (keep=sex weight);                                                                          
  set sashelp.class(obs=3);                                                                                  
run;quit;                                                                                                    
                                                                                                             
libname xel clear;                                                                                           
                                                                                                             
*                                                                                                            
 _ __  _ __ ___   ___ ___  ___ ___                                                                           
| '_ \| '__/ _ \ / __/ _ \/ __/ __|                                                                          
| |_) | | | (_) | (_|  __/\__ \__ \                                                                          
| .__/|_|  \___/ \___\___||___/___/                                                                          
|_|                                                                                                          
;                                                                                                            
                                                                                                             
* this works but ther is a bug in SAS and you may get warnings but it still works;                           
                                                                                                             
libname xel "d:/xls/multiple_named_ranges.xlsx" dbMax_text=32767 mixed=yes scantext=yes;                     
                                                                                                             
   proc copy in=xel out=work;                                                                                
  run;quit;                                                                                                  
                                                                                                             
libname xel clear;                                                                                           
                                                                                                             
*            _               _                                                                               
  ___  _   _| |_ _ __  _   _| |_                                                                             
 / _ \| | | | __| '_ \| | | | __|                                                                            
| (_) | |_| | |_| |_) | |_| | |_                                                                             
 \___/ \__,_|\__| .__/ \__,_|\__|                                                                            
                |_|                                                                                          
;                                                                                                            
                                                                                                             
Three SAS Tables in the work library                                                                         
                                                                                                             
                                                                                                             
up to 40 obs from NAME total obs=3                                                                           
                                                                                                             
bs     NAME      AGE                                                                                         
                                                                                                             
1     Alfred      14                                                                                         
2     Alice       13                                                                                         
3     Barbara     13                                                                                         
                                                                                                             
Up to 40 obs from SEXHGT total obs=3                                                                         
                                                                                                             
Obs    SEX    HEIGHT                                                                                         
                                                                                                             
 1      M      69.0                                                                                          
 2      F      56.5                                                                                          
 3      F      65.3                                                                                          
                                                                                                             
Up to 40 obs from SEXWGT total obs=3                                                                         
                                                                                                             
Obs    SEX    WEIGHT                                                                                         
                                                                                                             
 1      M      112.5                                                                                         
 2      F       84.0                                                                                         
 3      F       98.0                                                                                         
                                                                                                             
                                                                                                             
