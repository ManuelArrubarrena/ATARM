Attribute VB_Name = "Módulo1"
Sub ProfitsReal()

Application.DisplayAlerts = False
Application.ScreenUpdating = False
    
    Dim i As Integer
    Dim x As Double
    Dim z As Integer
    Dim xi As String
    Dim Div(3) As String
        Div(0) = "audjpy&"
        Div(1) = "euraud&"
        Div(2) = "eurcad&"
    
    Range("Q1").Select
    ActiveCell.FormulaR1C1 = "=+IF(RC[-1]>0,1,0)"
    z = 0
    For i = 0 To 2
        For x = 0.3 To 1.1 Step 0.1
'            xi = x & ".00"
            If x > 0.9 And x < 1.01 Then
                xi = x & ".00"
            Else
                xi = x & "0"
            End If
            ActiveSheet.Range("$A$5", Range("N5").End(xlDown)).AutoFilter Field:=5, Criteria1:=Div(i)
            ActiveSheet.Range("$A$5", Range("N5").End(xlDown)).AutoFilter Field:=4, Criteria1:=xi
            If Cells(5, 5).End(xlDown).Value = Div(i) Then
                Sheets.Add After:=ActiveSheet
                Sheets(1).Select
                Range("A5").Select
                Range(Selection, Selection.End(xlDown)).Select
                Range(Selection, Selection.End(xlToRight)).Select
                Selection.Copy
                Sheets(2).Select
                Range("B2").Select
                ActiveSheet.Paste
                Application.CutCopyMode = False
                Sheets(1).Select
                Range("Q1").Copy
                Sheets(2).Select
                Range("P3").Select
                ActiveSheet.Paste
                Application.CutCopyMode = False
                Range("P3").Copy
                Range("O3").Select
                Selection.End(xlDown).Offset(0, 1).Select
                Range(Selection, Selection.End(xlUp)).Select
                ActiveSheet.Paste
                Application.CutCopyMode = False
                Range("P2").Select
                ActiveCell.FormulaR1C1 = "=+SUM(R[1]C:R[100]C)"
                Range("P1").Select
                ActiveCell.FormulaR1C1 = "=+SUM(R[2]C[-4]:R[100]C[-1])"
                Range("Q2").Select
                ActiveCell.FormulaR1C1 = "=+COUNT(R[1]C[-2]:R[100]C[-2])"
                Range("R1").Select
                ActiveCell.FormulaR1C1 = "=+ABS(SUM(R[2]C[-6]:R[100]C[-6]))"
                Range("R2").Select
                ActiveCell.FormulaR1C1 = "=+RC[-2]/RC[-1]"
                Range("Q1").Select
                ActiveCell.FormulaR1C1 = "=+RC[-1]"
                Range("Q1").Copy
                Sheets(1).Select
                Cells(3 + z, 16).Select
                Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                    :=False, Transpose:=False
                Application.CutCopyMode = False
                Cells(3 + z, 15).Value = Div(i) & xi
                Sheets(2).Select
                Range("R2").Select
                Selection.Copy
                Sheets(1).Select
                Cells(3 + z, 17).Select
                Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                    :=False, Transpose:=False
                Application.CutCopyMode = False
                Sheets(2).Select
                Range("R1").Copy
                Sheets(1).Select
                Cells(4 + z, 17).Select
                Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                    :=False, Transpose:=False
                Application.CutCopyMode = False
                Sheets(2).Select
                ActiveWindow.SelectedSheets.Delete
            End If
            z = z + 2
        Next x
    Next i
Application.DisplayAlerts = True
Application.ScreenUpdating = True
End Sub

Sub ProfitsPrueba()

Application.DisplayAlerts = False
Application.ScreenUpdating = False
    
    Dim i As Integer
    Dim j As Integer
    Dim x As Integer
    Dim y As Integer
    Dim z As Integer
    Dim xi As String
    Dim Div(5) As String
        Div(0) = "RF"
        Div(1) = "INDI"
        Div(2) = "NIVES"
        Div(3) = "MOPEN"
        Div(4) = "INDINIV"
        
    j = Cells(5, 11).End(xlDown).Row
    For y = 7 To j Step 2
        Cells(y, 11).Cut
        Cells(y - 1, 15).Select
        ActiveSheet.Paste
        Application.CutCopyMode = False
    Next y
    Range("O5").Select
    ActiveCell.FormulaR1C1 = "Prueba"
    ActiveSheet.Range("$A$5", Cells(j, 15)).AutoFilter Field:=15, Criteria1:="<>"
    Range("$A$5", Range("$O$5").End(xlDown)).Select
    Selection.Copy
    Sheets.Add After:=ActiveSheet
    Range("A5").Select
        Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
            :=False, Transpose:=False
        Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
            :=False, Transpose:=False
    ActiveSheet.Previous.Select
    ActiveWindow.SelectedSheets.Delete
            
    Range("Q1").Select
    ActiveCell.FormulaR1C1 = "=+IF(RC[-2]>0,1,0)"
    z = 0
    For i = 0 To 4
        x = 1
        ActiveSheet.Range("$A$5", Range("O5").End(xlDown)).AutoFilter Field:=15, Criteria1:=Div(i)
        ActiveSheet.Range("$A$5", Range("O5").End(xlDown)).AutoFilter Field:=4, Criteria1:=x
        If Cells(5, 15).End(xlDown).Value = Div(i) Then
            Sheets.Add After:=ActiveSheet
            Sheets(1).Select
            Range("A5").Select
            Range(Selection, Selection.End(xlDown)).Select
            Range(Selection, Selection.End(xlToRight)).Select
            Selection.Copy
            Sheets(2).Select
            Range("B2").Select
            ActiveSheet.Paste
            Application.CutCopyMode = False
            Sheets(1).Select
            Range("Q1").Copy
            Sheets(2).Select
            Range("Q3").Select
            ActiveSheet.Paste
            Application.CutCopyMode = False
            Range("Q3").Copy
            Range("P3").Select
            Selection.End(xlDown).Offset(0, 1).Select
            Range(Selection, Selection.End(xlUp)).Select
            ActiveSheet.Paste
            Application.CutCopyMode = False
            Range("Q2").Select
            ActiveCell.FormulaR1C1 = "=+SUM(R[1]C:R[100]C)"
            Range("Q1").Select
            ActiveCell.FormulaR1C1 = "=+SUM(R[2]C[-5]:R[100]C[-2])"
            Range("R2").Select
            ActiveCell.FormulaR1C1 = "=+COUNT(R[1]C[-3]:R[100]C[-3])"
            Range("S1").Select
            ActiveCell.FormulaR1C1 = "=+ABS(SUM(R[2]C[-14]:R[100]C[-14]))"
            Range("S2").Select
            ActiveCell.FormulaR1C1 = "=+RC[-2]/RC[-1]"
            Range("R1").Select
            ActiveCell.FormulaR1C1 = "=+RC[-1]"
            Range("R1").Copy
            Sheets(1).Select
            Cells(3 + z, 17).Select
            Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                :=False, Transpose:=False
            Application.CutCopyMode = False
            Cells(3 + z, 16).Value = Div(i) & xi
            Sheets(2).Select
            Range("S2").Select
            Selection.Copy
            Sheets(1).Select
            Cells(3 + z, 18).Select
            Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                :=False, Transpose:=False
            Application.CutCopyMode = False
            Sheets(2).Select
            Range("S1").Copy
            Sheets(1).Select
            Cells(4 + z, 18).Select
            Selection.PasteSpecial Paste:=xlPasteValues, Operation:=xlNone, SkipBlanks _
                :=False, Transpose:=False
            Application.CutCopyMode = False
            Sheets(2).Select
            ActiveWindow.SelectedSheets.Delete
        End If
        z = z + 3
    Next i
Application.DisplayAlerts = True
Application.ScreenUpdating = True
End Sub


