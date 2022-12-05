codeunit 50100 "Validate Expense Type"
{
    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post and &Print', true, true)]
    local procedure RunOnBeforeActionEvent5(var Rec: Record "Purchase Header")
    begin
        Rec.TestField("Expense Type");
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post', true, true)]
    local procedure RunOnBeforeActionEvent6(var Rec: Record "Purchase Header")
    begin
        Rec.TestField("Expense Type");
    end;
}
