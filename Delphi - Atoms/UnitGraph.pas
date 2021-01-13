unit UnitGraph;

interface

uses
  UnitCluster,UnitBox, SysUtils;

{����� �������}
type TGraph = record
  ClustersN, PointsN : integer;  // ClustersN-���������� ��������� � ������
end;

{������ ����� �������}
type ArrTgraph = array of TGraph;

{������������� ��������� �� ������}
procedure Distribution(var box : TBox; var list : ArrTGraph);

{������� ����� ������� ����������� �����������}
procedure Dimension(biggestcluster : TCluster; r : real;
                    var list : arrTgraph; var num : integer);

{������ ������ � ����}
procedure WriteToFile(list : ArrTgraph; n : integer; r : real);


implementation

procedure Distribution(var box : TBox; var list : ArrTgraph);
var i, j : integer;
    max : integer;  {������������ ���-�� ����� � ��������}
begin

{������� ������������ ���������� ����� � ��������}

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

{������������� ��������� �� ���-�� ����� � ���}

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
{������� ����������� �����������}
procedure Dimension(biggestcluster :TCluster; r : real; var list :arrTgraph; var num :integer);
var i :integer;
    l : real;  {���������� ��� ���������� ����������}
    rmax : real;  {���������� ����������}
    r2, r1 :real;  {������� ��������������� �������}
begin
  r1:=r;
  r2:=0;
  num:=0;
  rmax:=0;

  {������� ����������� ����������}

  for i:=0 to biggestcluster.PointCount-1 do
  begin
    l := sqrt(sqr(biggestcluster.Xc - biggestcluster.Point[i].X)
         +sqr(biggestcluster.Yc - biggestcluster.Point[i].Y));
    if l > rmax then   
      rmax:=l;
  end;
  setlength(list, biggestcluster.PointCount);

  {������������� ���������� ����� �� ����������� ����������}

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
{������ ����������� ����������� ����������� � ����(�����)}
procedure WriteToFile(list :ArrTgraph; n : integer; r : real);
var fin : textfile;
    i : integer;
    rtemp : double;  {���������� ��� ������ ������}
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
