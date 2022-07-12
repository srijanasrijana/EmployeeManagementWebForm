var Validate = {};
var flag = false;

Validate.empty = function (string) {

    if (string == undefined) {
        string = "";
    }

    // return string.replace(/\s+/g, '').length == 0;
    return string.length == 0;
}
