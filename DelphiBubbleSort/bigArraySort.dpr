program bigArraySort;

{$APPTYPE CONSOLE}

{$R *.res}
{$INLINE AUTO}
{$OPTIMIZATION ON}
uses
  System.SysUtils, System.Classes, System.Diagnostics;
procedure BubbleSort(var A: TArray<Integer>);
var
  I, J,SwapCount,arraySize, Temp: Integer;
  swapRequired: Boolean;

begin
  arraySize:= 49999;
  SwapCount:=0;
  for I :=0  to arraySize -1 do
  begin
    swapRequired := false;
    for J := 0 to arraySize- I - 1 do
    begin
      if A[J] > A[J + 1] then
      begin
        Temp := A[J];
        A[J] := A[J + 1];
        A[J + 1] := Temp;
        SwapCount:=SwapCount+1;
        swapRequired:=true;
      end;
    end;
    if swapRequired=false then
      begin
      Break;
      end;
  end;
    Writeln(SwapCount);
end;

var
  Lines: TStringList;
  IntArray: TArray<Integer>;
  I: Integer;
    Stopwatch: TStopwatch;
   ElapsedMilliseconds: Int64;
begin
  Lines := TStringList.Create;
  try
    // Load the text file
    Lines.LoadFromFile('C:\Users\OmidTavana\Documents\Embarcadero\Studio\Projects\random_numbers.txt');


    SetLength(IntArray, Lines.Count);


    for I := 0 to Lines.Count - 1 do
    begin
      IntArray[I] := StrToInt(Lines[I]);
    end;
      // Start the stopwatch
    Stopwatch := TStopwatch.StartNew;

    // Sort the array using bubble sort
    BubbleSort(IntArray);

    // Stop the stopwatch
    Stopwatch.Stop;

    // Get the elapsed time
    ElapsedMilliseconds := Stopwatch.ElapsedMilliseconds;


    // Output the elapsed time
    // Output the elapsed time in seconds
  Writeln(Format('Bubble sort execution time: %.3f seconds', [ElapsedMilliseconds / 1000]));


    BubbleSort(IntArray);

//    for I := 0 to High(IntArray) do
//    begin
//      Writeln(IntArray[I]);
//    end;

  except
    on E: EConvertError do
      Writeln('Error converting string to integer: ', E.Message);
    on E: Exception do
      Writeln('An error occurred: ', E.Message);
  end;

  Lines.Free;

  // Wait for user to press Enter before closing the console
  Readln;

end.
