unit UnitGraph;

interface

uses
  UnitCluster,UnitBox, SysUtils;

{точка графика}
type TGraph = record
  ClustersN, PointsN : integer;  // ClustersN-количество кластеров с данным
end;

{массив точек графика}
type ArrTgraph = array of TGraph;

{распределение кластеров по точкам}
procedure Distribution(var box : TBox; var list : ArrTGraph);

{подсчЄт точек графика фрактальной размерности}
procedure Dimension(biggestcluster : TCluster; r : real;
                    var list : arrTgraph; var num : integer);

{запись данных в файл}
procedure WriteToFile(list : ArrTgraph; n : integer; r : real);


implementation

procedure Distribution(var box : TBox; var list : ArrTgraph);
var i, j : integer;
    max : integer;  {максимальное кол-во точек в кластере}
begin

{находим максимальное количество точек в кластере}

  SetLength(list,0);
  max := box.Clusters[0].PointCount;
  for i := 1 to box.ClustersCount-1 do
  begin
    if box.Clusters[i].PointCount > max then
    begin
      max := box.Clusters[i].PointCount;
    end;
  end;
  SetLength(list,max);

{–аспределение кластеров по кол-ву точек в них}

  for i := 0 to max-1 do
  begin
    list[i].PointsN := i+1;
    for j := 0 to box.ClustersCount-1 do
    begin
      if box.clusters[j].PointCount = i+1 then
      begin
        list[i].ClustersN := list[i].ClustersN + 1;
      end;
    end;
  end;
end;
{подсчЄт фрактальной размерности}
procedure Dimension(biggestcluster :TCluster; r : real; var list :arrTgraph; var num :integer);
var i :integer;
    l : real;  {переменна€ дл€ нахождени€ рассто€ний}
    rmax : real;  {наибольшее рассто€ние}
    r2, r1 :real;  {границы рассматриваемой области}
begin
  r1:=r;
  r2:=0;
  num:=0;
  rmax:=0;

  {подсчЄт наибольшего рассто€ни€}

  for i:=0 to biggestcluster.PointCount-1 do
  begin
    l := sqrt(sqr(biggestcluster.Xc - biggestcluster.Point[i].X)
         +sqr(biggestcluster.Yc - biggestcluster.Point[i].Y));
    if l > rmax then   
      rmax:=l;
  end;
  setlength(list, biggestcluster.PointCount);

  {–аспределение количества точек по промежуткам рассто€ний}

  while r1 <= rmax do
  begin
    for i := 0 to biggestcluster.PointCount-1 do
    begin
      l := sqrt(sqr(biggestcluster.Xc - biggestcluster.Point[i].X)
           +sqr(biggestcluster.Yc - biggestcluster.Point[i].Y));
      if (l > r2) and (l <= r1) then
        list[num].PointsN := list[num].PointsN + 1;
    end;
    if num>1 then
    list[num].PointsN:=list[num].PointsN+list[num-1].PointsN;
     r1 := r1+r;
     r2 := r2+r;
     num := num+1;
  end;
end;
{запись результатов фрактальной размерности в файл(точки)}
procedure WriteToFile(list :ArrTgraph; n : integer; r : real);
var fin : textfile;
    i : integer;
    rtemp : double;  {переменна€ дл€ вывода данных}
begin
  AssignFile(fin,'result.txt');
  Rewrite(fin);
  rtemp := r;
  for i := 0 to n do
  begin
    WriteLn(fin, IntToStr(list[i].PointsN) + '   '  + FloatToStr(rtemp)) ;
    rtemp := rtemp + r;
  end;

  CloseFile(fin);
end;
end.
