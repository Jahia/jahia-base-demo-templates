$(document).ready(function () {
    $("#search-options").click(function () {
        $(".arrow").toggleClass("arrow-rotate");
    });
});

function toggleSearchMode(field) {
    if (field.type == 'checkbox') {
        if (field.name.indexOf('siteContent') != -1) {
            document.getElementById('search-pages-criteria').style.display = field.checked ? '' : 'none';
        }
        if (field.name.indexOf('files') != -1) {
            document.getElementById('search-documents-criteria').style.display = field.checked ? '' : 'none';
        }
    } else {
        var o, i = 0;
        while (o = field.options[i++]) {
            if (o.value == 'siteContent') {
                document.getElementById('search-pages-criteria').style.display = o.selected ? '' : 'none';
            }
            if (o.value == 'files') {
                document.getElementById('search-documents-criteria').style.display = o.selected ? '' : 'none';
            }
        }
    }
}

function searchDateTypeToggle(dateType, range) {
    if (dateType.value == 'range' && range.style.display != 'none' || dateType.value != 'range' && range.style.display == 'none') {
        return;
    }
    range.style.display = dateType.value == 'range' ? '' : 'none';
    for (var i = 0; i < range.childNodes.length; i++) {
        if (range.childNodes[i].nodeName.toLowerCase() == 'input') {
            range.childNodes[i].disabled = dateType.value != 'range';
        }
    }
}