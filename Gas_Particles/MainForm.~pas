unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask,
  UnitCluster, UnitBox, UnitGraph, Series, TeEngine, TeeProcs, Chart;

type
  TmainForm1 = class(TForm)
    LblR: TLabel;
    LblN: TLabel;
    LblX: TLabel;
    LblY: TLabel;
    BtnInit: TButton;
    BtnStart: TButton;
    Tmr1: TTimer;
    PntBox1: TPaintBox;
    TxtN: TEdit;
    TxtR: TEdit;
    TxtE: TEdit;
    TxtX: TEdit;
    TxtY: TEdit;
    CheckT: TCheckBox;
    BtnPause: TButton;
    BtnGraph: TButton;
    RdgGraph: TRadioGroup;
    Chart: TChart;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TPointseries;
    BtnTicks: TButton;
    LblE: TLabel;
    TxtEb: TEdit;
    LblEb: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure BtnInitClick(Sender: TObject);
    procedure BtnStartClick(Sender: TObject);
    procedure Tmr1Timer(Sender: TObject);
    procedure BtnPauseClick(Sender: TObject);
    procedure BtnGraphClick(Sender: TObject);

    procedure Experiment;
    procedure RdgGraphClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  mainForm1: TMainForm1;
  box : TBox;
  distr, dimen : ArrTgraph;
  n, amount : integer;
  tickCount : integer; {суммарное время и количество тиков}
  sumTimeSqr, avgTime, disp, sumTime : real;    {сумма квадратов времен, среднее время}

implementation

{$R *.dfm}

procedure TMainForm1.FormCreate(Sender: TObject);
begin
  box := TBox.Create;
  {****************************
   эти строки надо закомментировать для обычного запуска
   и раскомментировать для Сашиного эксперимента}
  {Experiment;
  halt;}
  {***************************}
end;

procedure TMainForm1.BtnInitClick(Sender: TObject);  {ввод данных}
begin
  box.Init(StrToInt(TxtN.Text),
           StrToFloat(TxtR.Text),
           StrToFloat(TxtX.Text),
           StrToFloat(TxtY.Text),
           StrToFloat(TxtE.Text),
           StrToFloat(TxtEb.Text));
  mainForm1.BtnStart.Enabled := True;
  mainForm1.BtnTicks.Enabled:= True;
  Chart.Visible := False;
  PntBox1.Canvas.Brush.Color := clWhite;
  PntBox1.Canvas.Rectangle(0,0,pntBox1.Width,Pntbox1.Height);
end;

procedure TMainForm1.BtnStartClick(Sender: TObject);
begin

{нажатие на Старт}

if (not Tmr1.Enabled) then
  begin
    BtnInit.Enabled := False;
    BtnTicks.Enabled := False;

    Tmr1.Enabled := True;
    BtnPause.Enabled := True;
    BtnGraph.Enabled := True;
    CheckT.Enabled := True;
    RdgGraph.Enabled := True;

    BtnStart.Caption := 'Стоп';

{нажатие на Стоп}

  end else begin
    Tmr1.Enabled := False;
    r := 0;
    n := 0;
    box.Clear;

    BtnPause.Enabled := False;
    BtnGraph.Enabled := False;
    BtnStart.Enabled := False;
    CheckT.Enabled := False;
    RdgGraph.Enabled := False;

    BtnInit.Enabled := True;
    BtnStart.Caption := 'Старт';
    PntBox1.Canvas.Brush.Color := clWhite;
    PntBox1.Canvas.Rectangle(0,0,pntBox1.Width,Pntbox1.Height);
  end;
end;




procedure TMainForm1.Tmr1Timer(Sender: TObject); {один шаг}
var
  i, j, k : integer;
begin
    Chart.Series[0].Clear; //очищение гпафиков чтобы не накладывались
    chart.Series[1].Clear;
    chart.Series[2].Clear;
  If CheckT.Checked = True then
  begin
    check := true;
  end else begin
    check := false;
  end;
  box.Step;
  PntBox1.Canvas.Brush.Color := clWhite;
  PntBox1.Canvas.Rectangle(0,0,pntBox1.Width,pntBox1.Height);
  pntBox1.Canvas.Brush.Color := clRed;
  For i := 0 to box.ClustersCount-1 do
  begin
    For j := 0 to box.Clusters[i].PointCount-1 do
      pntBox1.Canvas.Ellipse(
                            round((pntBox1.Width/maxX) * (box.Clusters[i].Point[j].x - r)),
                            round((pntBox1.Height/maxY) * (box.Clusters[i].Point[j].y - r)),
                            round((pntBox1.Width/maxX) * (box.Clusters[i].Point[j].x + r)),
                            round((pntBox1.Height/maxY) * (box.Clusters[i].Point[j].y + r)));
  end;


  case RdgGraph.ItemIndex of

  1:   //график распределения атомов по кластерам
  begin
    distribution(box, distr);
    for k := 0 to box.ClustersCount-1 do
    begin
      if n < box.Clusters[k].PointCount then   //выбираем  кластер с наиб колвом атомов
        n := box.Clusters[k].PointCount;
    end;

    for i := 0 to n-1 do
    begin
      Chart.Series[1].AddXY(distr[i].Pointsn,distr[i].Clustersn);
    end;

    setLength(distr,0);
  end;

  2:   //количестов атомов в кластере
  begin
    for i:=0 to box.ClustersCount-1 do
      Chart.Series[0].AddXY(i,box.Clusters[i].PointCount);
  end;

  0:        //фрактальная размерность
  begin
    if box.ClustersCount=1 then
    begin
      dimension(box.Clusters[0],r,dimen,amount);
      WriteToFile(dimen,amount,r);
      for i:=1 to amount do
      begin
        Chart.Series[2].AddXY(i*r,dimen[i].Pointsn);
        dimen[i].Pointsn:=0;
      end;
    end;
  end;
end;
end;


procedure TMainForm1.BtnPauseClick(Sender: TObject);
begin
  If Tmr1.Enabled = true then
  begin
    BtnPause.Caption := 'Продолжить';
    tmr1.Enabled := false;
    BtnStart.Enabled := false;
  end else begin
    BtnPause.Caption := 'Пауза';
    tmr1.Enabled := true;
    BtnStart.Enabled := true;
  end;
end;

procedure TMainForm1.BtnGraphClick(Sender: TObject);
var i, j : integer;
begin
  If Chart.Visible = True then
  begin
    Chart.Visible := False;
    BtnGraph.Caption := 'Показать график';
    If BtnPause.Enabled = True then
    begin
      PntBox1.Canvas.Brush.Color := clWhite;
      PntBox1.Canvas.Rectangle(0,0,pntBox1.Width,pntBox1.Height);
      PntBox1.Canvas.Brush.Color := clRed;
      For i := 0 to box.ClustersCount-1 do
      begin
        For j := 0 to box.Clusters[i].PointCount-1 do
          pntBox1.Canvas.Ellipse(
                            round((pntBox1.Width/maxX) * (box.Clusters[i].Point[j].x - r)),
                            round((pntBox1.Height/maxY) * (box.Clusters[i].Point[j].y - r)),
                            round((pntBox1.Width/maxX) * (box.Clusters[i].Point[j].x + r)),
                            round((pntBox1.Height/maxY) * (box.Clusters[i].Point[j].y + r)));
      end;
    end;
  end else begin
    Chart.Visible := True;
    BtnGraph.Caption := 'Скрыть график';
    BtnStart.Enabled := False;
  end;
end;


procedure TMainForm1.Experiment;
var
        {параметры, которыми будет инициализирован box}
	clustersCount : integer;
	r, maxX, maxY, e, eb : real;

        {различные вспомогательные переменнтые}
	maxTacts : integer;
	i, j : integer;
	tmp: integer;
	f : textfile;

	numExpWithCurE : integer; {число удавшихся экспериментов с одной и той же энергией}
	sumTime : real; {суммарное время на все удавшиеся эксперименты}
	sumSqrTime : real; {суммарный квадрат времени на все удавшиеся эксперименты}

        avgTime : real; {среднее время, sumTime/numExpWithCurE}
        disp : real; {дисперсия времени на удавшиеся эксперименты}

        eArray : array[1..100] of integer; {массив энергий, которые нас интересуют}
        sizeEArray : integer; {размер этого массива}
begin
  sizeEArray := 1;
  eArray[sizeEArray] := 1; inc(sizeEArray);
  eArray[sizeEArray] := 2; inc(sizeEArray);
  eArray[sizeEArray] := 3; inc(sizeEArray);
  eArray[sizeEArray] := 5; inc(sizeEArray);
  eArray[sizeEArray] := 10; inc(sizeEArray);
  eArray[sizeEArray] := 15; inc(sizeEArray);
  eArray[sizeEArray] := 20; inc(sizeEArray);
  eArray[sizeEArray] := 30; inc(sizeEArray);
  eArray[sizeEArray] := 40; inc(sizeEArray);
  eArray[sizeEArray] := 50; inc(sizeEArray);
  eArray[sizeEArray] := 75; inc(sizeEArray);
  eArray[sizeEArray] := 100; inc(sizeEArray);
  eArray[sizeEArray] := 125; inc(sizeEArray);
  eArray[sizeEArray] := 140; inc(sizeEArray);
  eArray[sizeEArray] := 155; inc(sizeEArray);
  eArray[sizeEArray] := 170; inc(sizeEArray);
  eArray[sizeEArray] := 185; inc(sizeEArray);
  eArray[sizeEArray] := 200; inc(sizeEArray);
  eArray[sizeEArray] := 225; inc(sizeEArray);
  eArray[sizeEArray] := 250; inc(sizeEArray);
  eArray[sizeEArray] := 275; inc(sizeEArray);
  eArray[sizeEArray] := 300; inc(sizeEArray);
  eArray[sizeEArray] := 325; inc(sizeEArray);
  eArray[sizeEArray] := 350; inc(sizeEArray);
  eArray[sizeEArray] := 375; inc(sizeEArray);
  eArray[sizeEArray] := 400; inc(sizeEArray);
  eArray[sizeEArray] := 425; inc(sizeEArray);
  eArray[sizeEArray] := 450; inc(sizeEArray);
  eArray[sizeEArray] := 475; inc(sizeEArray);
  eArray[sizeEArray] := 500; inc(sizeEArray);
  eArray[sizeEArray] := 525; inc(sizeEArray);
  eArray[sizeEArray] := 550; inc(sizeEArray);
  eArray[sizeEArray] := 575; inc(sizeEArray);
  eArray[sizeEArray] := 600;

	clustersCount := 1000;
	r := 5;
	maxX := 1000;
	maxY := 1000;

	eb := 400;
	maxTacts := 10000;

	assignfile(f, 'exp.txt');
	rewrite(f);
	writeln(f, 'numExp   E    tacts   avgTime   sqrt(Disp)');

	for i := 1 to sizeEArray do
	begin
		numExpWithCurE := 0;
		sumTime := 0;
		sumSqrTime := 0;

		for j := 1 to 20 do
		begin
			e := eArray[i];
			box.Init(clustersCount, r, maxX, maxY, e, eb);
			tmp := box.WorkUntilClusters(maxTacts);

			if (tmp <> -1) then
			begin
				inc(numExpWithCurE);
				sumTime := sumTime + tmp;
				sumSqrTime := sumSqrTime + sqr(tmp);
			end;
		end;

		if (numExpWithCurE > 0) then
		begin
                        avgTime := sumTime / numExpWithCurE;
                        disp := (sumSqrTime / numExpWithCurE) - sqr(avgTime);

			writeln(f,
					numExpWithCurE:2, '   ',
					e:5:1, '   ',
                        		tmp:6, '    ',
                                        avgTime:6:2, '  ',
					sqrt(disp):6:2);
		end else begin
			writeln(f, 'There is timeout always :-(');
		end;
                flush(f);

	end;

	closefile(f);
end;


procedure TMainForm1.RdgGraphClick(Sender: TObject);
var k,i:integer;
begin
  Chart.Series[0].Clear; //очищение гпафиков чтобы не накладывались
  chart.Series[1].Clear;
  chart.series[2].Clear;
  case RdgGraph.ItemIndex of
  1:   //график распределения атомов по кластерам
  begin
    distribution(box, distr);
    for k := 0 to box.ClustersCount-1 do
    begin
      if n < box.Clusters[k].PointCount then   //выбираем  кластер с наиб колвом атомов
        n := box.Clusters[k].PointCount;
    end;
    for i := 0 to n-1 do
    begin
      Chart.Series[1].AddXY(distr[i].Pointsn
                            ,distr[i].Clustersn);
    end;
    setLength(distr,0);
  end;

  2:   //количестов атомов в кластере
  begin
    for i:=0 to box.ClustersCount-1 do
      Chart.Series[0].AddXY(i,box.Clusters[i].PointCount);
  end;

  0:        //фрактальная размерность
  begin
    if box.ClustersCount=1 then
    begin
      dimension(box.Clusters[0],StrToInt(txtr.Text)
                ,dimen,amount);
      WriteToFile(dimen,amount,StrToInt(txtr.Text));
      for i:=1 to amount do
      begin
        Chart.Series[2].AddXY(i*StrToFloat(txtr.text)
                              ,dimen[i].Pointsn);
        dimen[i].Pointsn:=0;
      end;
    end;
  end;
end;
end;
end.

