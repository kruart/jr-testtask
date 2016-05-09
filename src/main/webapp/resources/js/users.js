/*Created by Arthur on 15/4/2015.*/
function go(url)
{
    window.location = url;
}

function newUser()
{
    window.location = "saveUser.do";
}

function deleteUser(url)
{
    var isOK = confirm("Удалить пользователя?");
    if(isOK)
    {
        go(url);
    }
}
