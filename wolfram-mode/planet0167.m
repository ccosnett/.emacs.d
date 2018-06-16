#!/home/conor/mathematica/WolframScript -script

var="100";

<<cross`;
Ycols = 1;
Xrows=2000;
set = Join @@ Table[
    Table[
     {x, y},
     {y, 1, Ycols}
     ]
    , {x, 1, Xrows}
    ]
tSet[{X_, Y_}] := ttt[X] ~~ ttt[Y];
XY[n_] := set[[n]];

(*varfoobar = "/FITZ/f" ~~ var ~~ "/";*)
(*folder = "~/datacontainer1/11_pex/mes/experimenter/folderPoint" ~~ var ~~ 
 "/";*)
folder ="";
varfoobar="";
outFolder="";




f[n_] := If[FileExistsQ[folder ~~ "plan"~~tSet[XY[n]]~~".jpg"],
   Print["File "~~folder ~~ "plan"~~tSet[XY[n]]~~".jpg"~~"    already exists"], (Print[
     "File does not exist so lets compute it:    "~~folder ~~ "plan"~~tSet[XY[n]]~~".jpg"~~""];
    exporter[outFolder, n, varfoobar])
   ];


f /@ Range[1, 167]
Print["planet " ~~ var ~~ " completed"]
