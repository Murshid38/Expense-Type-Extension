pageextension 50104 "Purch Order Ext" extends "Purchase Order"
{
    layout
    {
        addafter("Quote No.")
        {
            field("Expense Type"; Rec."Expense Type")
            {
                ApplicationArea = all;
                ToolTip = 'Specifies the value of Expense Type';
            }
        }
    }
}
