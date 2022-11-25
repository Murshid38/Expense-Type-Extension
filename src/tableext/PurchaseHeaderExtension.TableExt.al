tableextension 50100 "Purchase Header Extension" extends "Purchase Header"
{
    fields
    {
        field(50100; "Expense Type"; enum "Expense Type")
        {
            Caption = 'Expense Type';
            DataClassification = CustomerContent;
        }
    }
}
