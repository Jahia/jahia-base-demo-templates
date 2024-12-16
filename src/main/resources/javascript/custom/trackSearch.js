function registerSearchListener(formId) {
    if (window.wem) {
        document.addEventListener('DOMContentLoaded', () => {
            document.getElementById(formId).addEventListener('submit', function (event) {
                console.log(event.target);
                const searchTermInput = event.target.elements['searchTerm'];
                const languageInput = event.target.querySelector('[name="src_languages.values"]');
                const searchEvent = window.wem.buildSearchEvent(formId, event.target, searchTermInput.value, languageInput.value);
                window.wem.collectEvent(searchEvent,
                    () => console.debug('[Collecting search event] search formEvent sent'),
                    () => console.debug('[Collecting search event] oups search formEvent was not handled properly')
                );
            });
        });
    } else {
        console.debug('Wem does not exist');
    }
}
