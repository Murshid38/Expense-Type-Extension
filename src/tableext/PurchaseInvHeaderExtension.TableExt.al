tableextension 50101 "Purchase Inv Header Extension" extends "Purch. Inv. Header"
{
    fields
    {
        field(50100; "Expense Type"; enum "Expense Type")
        {
            Caption = 'Expense Type';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
}
