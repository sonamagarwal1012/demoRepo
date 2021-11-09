trigger AddMrInAccount on Account (before insert) {
for(account a :trigger.new)
{
    a.name='mr.' + a.name;
}
}