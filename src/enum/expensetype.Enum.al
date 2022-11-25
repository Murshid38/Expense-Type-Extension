enum 50100 "Expense Type"
{
    Extensible = true;

    value(0; "")
    {
        Caption = 'Blank';
    }
    value(1; Capex)
    {
        Caption = 'Capital Expediture';
    }
    value(2; Opex)
    {
        Caption = ' Operational Expenditure';
    }
}
