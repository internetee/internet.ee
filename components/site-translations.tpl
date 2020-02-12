{% comment %}TEMPLATE TEXT TRANSLATIONS{% endcomment %}
{% comment %}Delete this component and remove the "include" tag from the "html_head" component if it there are no texts to translate.{% endcomment %}
{% comment %}Add languages and translations in alphabetical order{% endcomment %}
{% capture dont_render %}
{% case page.language_code %}
  {% comment %}Estonian{% endcomment %}
    {% when "et" %}
      {% assign registrant_link = "Registreerija portaal" %}
      {% assign registrant_link_url = "https://registrant.internet.ee/" %}
      {% assign registrar_link = "Registripidaja portaal" %}
      {% assign registrar_link_url = "https://registrar.internet.ee/" %}
      {% assign search_placeholder = "leia kodulehelt" %}
      {% assign identification_methods = "Isikutuvastuse viisid" %}
      {% assign customer_service = "Klienditeenindus" %}
      {% assign domain_status = "Staatus" %}
      {% assign domain_registered_at = "Registreeritud" %}
      {% assign domain_registrant = "Registreerija" %}
      {% assign domain_expire = "Aegub" %}
      {% assign domain_outzone = "Peatub" %}
      {% assign domain_delete = "Kustub" %}
      {% assign domain_dnssec = "DNSSEC" %}
      {% assign domain_registrar = "Registripidaja" %}
      {% assign domain_contacts = "Rohkem infot" %}
      {% assign domain_stats_total = "Kokku registreeritud domeene" %}
      {% assign domain_stats_today = "Täna registreeritud domeene" %}
      {% assign domain_stats_statistics = "Vaata statistikat" %}
      {% assign domain_changed_at = "Muudetud" %}
      {% assign domain_nservers = "Nimeserverid" %}
      {% assign domain_query_timestamp = "Päringu ajatempel" %}
      {% assign domain_dnskey = "DNSSEC võtmed" %}
      {% assign domain_tech_contact = "Tehniline kontakt" %}
      {% assign domain_admin_contact = "Halduskontakt" %}
      {% assign domain_search = "Otsi domeeni" %}
      {% assign domain_registration = "Registreerimine" %}
      {% assign article_author = "Autor" %}
      {% assign article_topic = "Teema" %}
      {% assign article_tags = "Sildid" %}
      {% assign ident_methods_tooltip = "Meetodid millega registripidaja võimaldab kliendil registreerimisteenuste taotlusi allkirjastada" %}
      {% assign dnssec_service_tooltip = "ROHELISE võtme märk tähistab DNSSEC täisteenust pakkuvaid registripidajaid www.dnssec.ee. MUST ep märk tähistab .ee Elite partnereid. SININE <1 tähistab 3,6,9 kuu pikkuseid ehk lühikesi perioode pakkuvaid registripidajaid." %}
      {% assign customer_service_tooltip = "Registripidaja pakutavad klienditeeninduse kanalid" %}
      {% assign registrant_url_tooltip = "Registripidaja veebilehe aadress" %}
      {% assign more_info_tooltip = "Registripidaja telefoninumber, e-postiaadress ning pakutavad klienditeeninduse keeled" %}
      {% assign domain_registered_error = "on registreeritud" %}
      {% assign domain_query_error = "on vaba" %}
      {% assign domain_validation_error = "on ebakorrektne" %}
      {% assign domain_blocked_error = "on blokeeritud" %}
      {% assign domain_reserved_error = "on reserveeritud" %}
      {% assign domain_deleted_error = "on kustutamisel" %}
      {% assign domain_technical_error = "Tehniline probleem, palun proovige hiljem uuesti" %}
      {% assign domain_auction_error = "on oksjonil" %}
      {% assign domain_pending_registration_error = "registreering on ootel" %}
      {% assign click_here = "Näita täpsemat infot" %}
      {% assign comments = "Kommentaarid" %}
      {% assign new_comment = "Uus kommentaar" %}
      {% assign show_more = "Kuva rohkem" %}
      {% assign loading = "Laeb..." %}
      {% assign icon = "Ikoon" %}
      {% assign available_icons = "Saadaolevad ikoonid" %}
      {% assign element_added = "Element lisatud" %}
      {% assign menu_footer_title = "Leia kiirelt" %}
      {% assign menu_social_title = "Sotsiaalmeedia" %}
      {% assign label_domain_auctions = "Domeenioksjonid" %}
      {% assign label_more_domains = "domeeni veel" %}
      {% assign label_view_all = "Vaata kõiki" %}
      {% assign label_close = "Sulge" %}
      {% assign label_open = "Ava" %}
      {% assign label_detail_info = "detailne info" %}
      {% assign label_back = "Tagasi" %}
      {% assign label_edit = "Muuda" %}
      {% assign label_more_options = "Rohkem valikuid" %}
      {% assign label_less_options = "Vähem valikuid" %}
      {% assign label_show_dns_keys = "Kuva DNS võtmed" %}
      {% assign label_hide_dns_keys = "Peida DNS võtmed" %}
      {% assign label_regenerate = "Genereeri uuesti" %}
      {% assign label_search = "Otsi" %}
      {% assign label_search_keyword = "Otsi märksõna" %}
      {% assign label_search_registrar = "Otsi registripidajat" %}
      {% assign label_date_from = "Kuupäev alates" %}
      {% assign label_date_to = "Kuupäev kuni" %}
      {% assign label_reset = "Tühjenda" %}
      {% assign label_public_portal = "Avalik portaal" %}
      {% assign label_sign_in = "Logi sisse" %}
      {% assign label_open_search = "Ava otsing" %}
      {% assign label_open_menu = "Ava menüü" %}
      {% assign label_open_calendar = "Ava kalender" %}
      {% assign label_contact_registrant = "Kontakteeru registreerijaga" %}
      {% assign label_private_person  = "Eraisik" %}
      {% assign label_not_disclosed  = "Avaldamata" %}
      {% assign label_short_periods = "Lühikesed perioodid" %}
      {% assign label_results_per_page = "Tulemusi lehel" %}
      {% assign label_all = "Kõik" %}
      {% assign label_total_domainauctions = "Domeene oksjonil" %}
      {% assign send_comment = "Saada" %}
      {% assign abbr_days = "p" %}
      {% assign abbr_hours = "t" %}
      {% assign abbr_minutes = "m" %}
      {% assign abbr_seconds = "s" %}
    {% comment %}Russian{% endcomment %}
    {% when "ru" %}
      {% assign registrant_link = "Портал для регистрантов" %}
      {% assign registrant_link_url = "https://registrant.internet.ee/" %}
      {% assign identification_methods = "Identification methods" %}
      {% assign search_placeholder = "Поиск" %}
      {% assign customer_service = "Customer service" %}
      {% assign domain_status = "Status" %}
      {% assign domain_registered_at = "Registered" %}
      {% assign domain_registrant = "Registrant" %}
      {% assign domain_expire = "Expiry" %}
      {% assign domain_outzone = "Removed from zone" %}
      {% assign domain_delete = "Deleted" %}
      {% assign domain_dnssec = "DNSSEC" %}
      {% assign domain_registrar = "Registrar" %}
      {% assign domain_contacts = "КОНТАКТНЫЕ ДАННЫЕ" %}
      {% assign domain_stats_total = "Всего зарегистрировано" %}
      {% assign domain_stats_today = "Сегодня зарегистрировано" %}
      {% assign domain_stats_statistics = "Посмотрите статистику" %}
      {% assign domain_changed_at = "Changed" %}
      {% assign domain_nservers = "Nameservers" %}
      {% assign domain_query_timestamp = "Query timestamp" %}
      {% assign domain_dnskey = "DNSSEC key" %}
      {% assign domain_tech_contact = "Technical contact" %}
      {% assign domain_admin_contact = "Administrative contact" %}
      {% assign domain_search = "Поиск домена" %}
      {% assign domain_registration = "Pегистрация" %}
      {% assign article_author = "Author" %}
      {% assign article_topic = "Topic" %}
      {% assign article_tags = "Tags" %}
      {% assign domain_registered_error = "зарегистрирован" %}
      {% assign domain_query_error = "is available" %}
      {% assign domain_validation_error = "is invalid" %}
      {% assign domain_blocked_error = "is blocked" %}
      {% assign domain_reserved_error = "is reserved" %}
      {% assign domain_deleted_error = "is being deleted" %}
      {% assign domain_technical_error = "Technical error, please try again later" %}
      {% assign domain_auction_error = "is at auction" %}
      {% assign domain_pending_registration_error = "pending registration" %}
      {% assign click_here = "кликните сюда" %}
      {% assign show_more = "Show more" %}
      {% assign loading = "Loading..." %}
      {% assign icon = "Icon" %}
      {% assign available_icons = "Available Icons" %}
      {% assign element_added = "Element added" %}
      {% assign menu_footer_title = "Find quick" %}
      {% assign menu_social_title = "Социальные сети" %}
      {% assign label_domain_auctions = "Domain Auctions" %}
      {% assign label_more_domains = "more domains" %}
      {% assign label_view_all = "Все новости" %}
      {% assign label_close = "Закрыть" %}
      {% assign label_open = "Open" %}
      {% assign label_detail_info = "detail info" %}
      {% assign label_back = "Back" %}
      {% assign label_edit = "Edit" %}
      {% assign label_more_options = "more options" %}
      {% assign label_less_options = "less options" %}
      {% assign label_show_dns_keys = "Show DNS keys" %}
      {% assign label_hide_dns_keys = "Hide DNS keys" %}
      {% assign label_regenerate = "Regenerate" %}
      {% assign label_search = "Поиск" %}
      {% assign label_search_keyword = "Поиск по ключевому слову" %}
      {% assign label_search_registrar = "Поиск регистратора" %}
      {% assign label_date_from = "с" %}
      {% assign label_date_to = "по" %}
      {% assign label_reset = "Oчистить" %}
      {% assign label_public_portal = "Oбщественный портал" %}
      {% assign label_sign_in = "Log in" %}
      {% assign label_open_search = "Open search box" %}
      {% assign label_open_menu = "Open menu" %}
      {% assign label_open_calendar = "Open calendar" %}
      {% assign label_contact_registrant = "Contact registrant" %}
      {% assign label_private_person  = "Private person" %}
      {% assign label_not_disclosed  = "Not disclosed" %}
      {% assign label_short_periods = "Short periods" %}
      {% assign label_results_per_page = "Results per page" %}
      {% assign label_all = "All" %}
      {% assign label_total_domainauctions = "Domains on auction" %}
      {% assign send_comment = "послать" %}
      {% assign abbr_days = "d" %}
      {% assign abbr_hours = "h" %}
      {% assign abbr_minutes = "m" %}
      {% assign abbr_seconds = "s" %}
      {% comment %}Every other language{% endcomment %}
    {% else %}
      {% assign registrant_link = "registrant's portal" %}
      {% assign registrant_link_url = "https://registrant.internet.ee/" %}
      {% assign registrar_link = "registrar's portal" %}
      {% assign registrar_link_url = "https://registrar.internet.ee/" %}
      {% assign search_placeholder = "site search" %}
      {% assign customer_service = "Customer service" %}
      {% assign domain_status = "Status" %}
      {% assign domain_registered_at = "Registered" %}
      {% assign domain_registrant = "Registrant" %}
      {% assign domain_expire = "Expiry" %}
      {% assign domain_outzone = "Removed from zone" %}
      {% assign domain_delete = "Deleted" %}
      {% assign domain_dnssec = "DNSSEC" %}
      {% assign domain_registrar = "Registrar" %}
      {% assign domain_contacts = "Contacts" %}
      {% assign domain_stats_total = "Total of registered domains" %}
      {% assign domain_stats_today = "Domains registered today" %}
      {% assign domain_stats_statistics = "View statistics" %}
      {% assign domain_stats_domains = "domeeni" %}
      {% assign domain_changed_at = "Changed" %}
      {% assign domain_nservers = "Nameservers" %}
      {% assign domain_query_timestamp = "Query timestamp" %}
      {% assign domain_dnskey = "DNSSEC key" %}
      {% assign domain_tech_contact = "Technical contact" %}
      {% assign domain_admin_contact = "Administrative contact" %}
      {% assign domain_search = "Search for domain" %}
      {% assign domain_registration = "Registration" %}
      {% assign article_author = "Author" %}
      {% assign article_topic = "Topic" %}
      {% assign article_tags = "Tags" %}
      {% assign domain_registered_error = "is registered" %}
      {% assign domain_query_error = "is available" %}
      {% assign domain_validation_error = "is invalid" %}
      {% assign domain_blocked_error = "is blocked" %}
      {% assign domain_reserved_error = "is reserved" %}
      {% assign domain_deleted_error = "is being deleted" %}
      {% assign domain_technical_error = "Technical error, please try again later" %}
      {% assign domain_auction_error = "is at auction" %}
      {% assign domain_pending_registration_error = "pending registration" %}
      {% assign click_here = "Click here" %}
      {% assign show_more = "Show more" %}
      {% assign loading = "Loading..." %}
      {% assign icon = "Icon" %}
      {% assign available_icons = "Available Icons" %}
      {% assign element_added = "Element added" %}
      {% assign menu_footer_title = "Quick links" %}
      {% assign menu_social_title = "Social media" %}
      {% assign label_domain_auctions = "Domain auctions" %}
      {% assign label_more_domains = "more domains" %}
      {% assign label_view_all = "View all" %}
      {% assign label_close = "Close" %}
      {% assign label_open = "Open" %}
      {% assign label_detail_info = "detailed info" %}
      {% assign label_back = "Back" %}
      {% assign label_edit = "Edit" %}
      {% assign label_more_options = "More options" %}
      {% assign label_less_options = "Less options" %}
      {% assign label_show_dns_keys = "Show DNS keys" %}
      {% assign label_hide_dns_keys = "Hide DNS keys" %}
      {% assign label_search = "Search" %}
      {% assign label_regenerate = "Regenerate" %}
      {% assign label_search_keyword = "Search for keyword" %}
      {% assign label_search_registrar = "Search for registrar" %}
      {% assign label_date_from = "Date from" %}
      {% assign label_date_to = "Date to" %}
      {% assign label_reset = "Reset" %}
      {% assign label_public_portal = "Public portal" %}
      {% assign label_sign_in = "Log in" %}
      {% assign label_open_search = "Open search box" %}
      {% assign label_open_menu = "Open menu" %}
      {% assign label_open_calendar = "Open calendar" %}
      {% assign label_contact_registrant = "Contact registrant" %}
      {% assign label_private_person  = "Private person" %}
      {% assign label_not_disclosed  = "Not disclosed" %}
      {% assign label_short_periods = "Short periods" %}
      {% assign label_results_per_page = "Results per page" %}
      {% assign label_all = "All" %}
      {% assign label_total_domainauctions = "Domains on auction" %}
      {% assign send_comment = "Send" %}
      {% assign abbr_days = "d" %}
      {% assign abbr_hours = "h" %}
      {% assign abbr_minutes = "m" %}
      {% assign abbr_seconds = "s" %}
  {% endcase %}
{% endcapture %}

<script type="text/javascript">
  window.translations = {
    {% case page.language_code %}
    {% when 'et' %}
    'total_chart': {
      'title': 'Domeene riikide lõikes',
    },
    'mix_chart': {
      'renewals': 'Pikendamised',
      'registrations': 'Uued registreeringud',
      'deletions': 'Kustumised',
    },
    'registrations_chart': {
      'title': 'Registreerijatele kuuluvate domeenide arv',
      'legend_title': 'Registreerijate arv',
      'text_1_domain': '1 domeen',
      'text_2_domains': '2 domeeni',
      'text_3_domains': '3 domeeni',
      'text_4_domains': '4 domeeni',
      'text_5_domains': '5 domeeni',
      'text_6_to_10_domains': '6 - 10 domeeni',
      'text_11_to_25_domains': '11 - 25 domeeni',
      'text_26_to_50_domains': '26 - 50 domeeni',
      'text_51_to_100_domains': '51 - 100 domeeni',
      'text_101_to_200_domains': '101 - 200 domeeni',
      'text_201_to_500_domains': '201 - 500 domeeni',
      'text_501_to_1000_domains': '501 - 1000 domeeni',
      'text_1001_to_2000_domains': '1001 - 2000 domeeni',
      'text_2001_or_more_domains': '2000 või enam domeeni',
    },
    'org_chart': {
      'title': 'Eesti juriidilisest isikust registreerijate jaotuse tüübiline koosseis',
      'legend_title': 'Registreerijate arv',
      't1': 'Äriühing',
      't7': 'Riigiasutus',
      't8': 'MTÜ',
      't9': 'SA',
    },
    'sex_chart': {
      'men': 'Mehed',
      'women': 'Naised',
      'title': 'Füüsilisest isikust registreerijate sooline ja vanuseline koosseis',
      'registered_domains': 'Registreeritud domeene',
      'gender_composition': 'Sooline koosseis',
      'age_group': 'Vanuseline koosseis',
      'total_domains': 'Domeene kokku',
      'total': 'Kokku'
    },
    'months': [
      'jaanuar',
      'veebruar',
      'märts',
      'aprill',
      'mai',
      'juuni',
      'juuli',
      'august',
      'september',
      'oktoober',
      'november',
      'detsember'
    ],
    'domains': {
      'dnssec_signed': 'Allkirjastatud',
      'dnssec_unsigned': 'Allkirjastamata',
      "ok (paid and in zone)": 'on registreeritud',
      "expired": "on aegunud",
      "serverHold": 'on peatatud',
      "serverRenewProhibited": 'uuendamine on keelatud',
      "serverTransferProhibited": 'registripidaja vahetamine on keelatud',
      "serverRegistrantChangeProhibited": 'registreerija vahetamine on keelatud',
      "serverAdminChangeProhibited": 'admin kontakti vahetamine on keelatud',
      "serverTechChangeProhibited": 'tehnilise kontakti vahetamine on keelatud',
      "serverUpdateProhibited": 'andmete muutmine on keelatud',
      "serverDeleteProhibited": 'kustutamine on keelatud',
      "serverForceDelete": 'kustutatakse',
      "pendingUpdate": 'muudatused on ootel',
      "pendingDelete": 'ootab kustutamist',
      "serverManualInzone": 'hoitakse tsoonis',
      "Blocked": 'on blokeeritud',
      "Reserved": 'on reserveeritud',
      "inactive": 'ei ole tsooni lisatud',
      "deleteCandidate": 'on kustutamisel',
      "pendingDeleteConfirmation": 'kustutamise kinnitus on ootel',
      "pendingRenew": 'uuendamine on ootel',
      "pendingTransfer": 'registripidaja vahetus on ootel',
      "pendingCreate": 'loomine on ootel',
    },
    'domainstatuses': {
      'dnssec_signed': 'Allkirjastatud',
      'dnssec_unsigned': 'Allkirjastamata',
      "ok (paid and in zone)": 'Makstud ja tsoonis',
      "expired": "Aegunud",
      "serverHold": 'Domeen on peatatud',
      "serverRenewProhibited": 'Uuendamine keelatud',
      "serverTransferProhibited": 'Registripidaja vahetamine keelatud',
      "serverRegistrantChangeProhibited": 'Registreerija vahetamine keelatud',
      "serverAdminChangeProhibited": 'Admin kontakti vahetamine keelatud',
      "serverTechChangeProhibited": 'Tehnilise kontakti vahetamine keelatud',
      "serverUpdateProhibited": 'Andmete muutmine keelatud',
      "serverDeleteProhibited": 'Kustutamine keelatud',
      "serverForceDelete": 'Domeen kustutatakse',
      "pendingUpdate": 'Domeeni muudatused ootel',
      "pendingDelete": 'Domeen ootab kustutamist',
      "serverManualInzone": 'Domeeni hoitakse tsoonis',
      "Blocked": 'Domeen blokeeritud',
      "Reserved": 'Domeen reserveeritud',
      "inactive": 'Domeen ei ole tsooni lisatud',
      "deleteCandidate": 'Domeen kustutatakse'
    },
    'search': {
      'pages': 'Leheküljed',
      'articles': 'Artiklid'
    },
    'upload': {
      'add_file': 'Vali fail',
      'remove_file': 'Eemalda fail'
    }
    {% when 'ru' %}
    'total_chart': {
      'title': 'Domain registrations by country',
    },
    'mix_chart': {
      'renewals': 'Renewals',
      'registrations': 'Registrations',
      'deletions': 'Deletions',
    },
    'registrations_chart': {
      'title': 'Registreerijatele kuuluvate domeenide arv',
      'legend_title': 'Registreerijate arv',
      'text_1_domain': '1 domain',
      'text_2_domains': '2 domains',
      'text_3_domains': '3 domains',
      'text_4_domains': '4 domains',
      'text_5_domains': '5 domains',
      'text_6_to_10_domains': '6 - 10 domains',
      'text_11_to_25_domains': '11 - 25 domains',
      'text_26_to_50_domains': '26 - 50 domains',
      'text_51_to_100_domains': '51 - 100 domains',
      'text_101_to_200_domains': '101 - 200 domains',
      'text_201_to_500_domains': '201 - 500 domains',
      'text_501_to_1000_domains': '501 - 1000 domains',
      'text_1001_to_2000_domains': '1001 - 2000 domains',
      'text_2001_or_more_domains': '2000 või enam domains',
    },
    'org_chart': {
      'title': 'Eesti juriidilisest isikust registreerijate jaotuse tüübiline koosseis',
      'legend_title': 'Registreerijate arv',
      't1': 'Äriühing',
      't7': 'Riigiasutus',
      't8': 'MTÜ',
      't9': 'SA',
    },
    'sex_chart': {
      'men': 'Men',
      'women': 'Women',
      'title': 'Registrations by gender (male/female) and age',
      'registered_domains': 'Registered domains',
      'gender_composition': 'Gender composition',
      'age_group': 'year born',
      'total_domains': 'Total of domains',
      'total': 'Total'
    },
    'months': [
      'Январь',
      'Февраль',
      'Март',
      'Апрель',
      'Май',
      'Июнь',
      'Июль',
      'Август',
      'Сентябрь',
      'Октябрь',
      'Ноябрь',
      'Декабрь'
    ],
    'domains': {
      'dnssec_signed': 'Signed',
      'dnssec_unsigned': 'Not Signed',
      "ok (paid and in zone)": 'is registered',
      "expired": "is expired",
      "serverHold": 'is on hold',
      "serverRenewProhibited": 'renewal is prohibited',
      "serverTransferProhibited": 'transfer is prohibited',
      "serverRegistrantChangeProhibited": 'registrant change is prohibited',
      "serverAdminChangeProhibited": 'admin change is prohibited',
      "serverTechChangeProhibited": 'tech change is prohibited',
      "serverUpdateProhibited": 'update is prohibited',
      "serverDeleteProhibited": 'delete is prohibited',
      "serverForceDelete": 'is forced to delete',
      "pendingUpdate": 'has pending update',
      "pendingDelete": 'has pending delete',
      "serverManualInzone": 'is kept in zone',
      "Blocked": 'is blocked',
      "Reserved": 'is reserved',
      "inactive": 'is inactive',
      "deleteCandidate": 'will be deleted',
      "pendingDeleteConfirmation": 'has pending delete confirmation',
      "pendingRenew": 'has pending renewal',
      "pendingTransfer": 'has pending registrant change',
      "pendingCreate": 'is being created',
    },
    'domainstatuses': {
      'dnssec_signed': 'Signed',
      'dnssec_unsigned': 'Not Signed',
      "ok (paid and in zone)": 'OK',
      "expired": "Expired",
      "serverHold": 'on Hold',
      "serverRenewProhibited": 'Renew Prohibited',
      "serverTransferProhibited": 'Transfer Prohibited',
      "serverRegistrantChangeProhibited": 'Registrant Change Prohibited',
      "serverAdminChangeProhibited": 'Admin Change Prohibited',
      "serverTechChangeProhibited": 'Tech Change Prohibited',
      "serverUpdateProhibited": 'Update Prohibited',
      "serverDeleteProhibited": 'Delete Prohibited',
      "serverForceDelete": 'Forced to Delete',
      "pendingUpdate": 'Pending Update',
      "pendingDelete": 'Pending Delete',
      "serverManualInzone": 'Kept in Zone',
      "Blocked": 'Blocked',
      "Reserved": 'Reserved',
      "inactive": 'Inactive',
      "deleteCandidate": 'Will be Deleted'
    },
    'search': {
      'pages': 'Leheküljed',
      'articles': 'Artiklid'
    },
    'upload': {
      'add_file': 'Add file',
      'remove_file': 'Remove file'
    }
    {% else %}
    'total_chart': {
      'title': 'Domain registrations by country',
    },
    'mix_chart': {
      'renewals': 'Renewals',
      'registrations': 'Registrations',
      'deletions': 'Deletions',
    },
    'registrations_chart': {
      'title': 'Registreerijatele kuuluvate domeenide arv',
      'legend_title': 'Registreerijate arv',
      'text_1_domain': '1 domain',
      'text_2_domains': '2 domains',
      'text_3_domains': '3 domains',
      'text_4_domains': '4 domains',
      'text_5_domains': '5 domains',
      'text_6_to_10_domains': '6 - 10 domains',
      'text_11_to_25_domains': '11 - 25 domains',
      'text_26_to_50_domains': '26 - 50 domains',
      'text_51_to_100_domains': '51 - 100 domains',
      'text_101_to_200_domains': '101 - 200 domains',
      'text_201_to_500_domains': '201 - 500 domains',
      'text_501_to_1000_domains': '501 - 1000 domains',
      'text_1001_to_2000_domains': '1001 - 2000 domains',
      'text_2001_or_more_domains': '2000 või enam domains',
    },
    'org_chart': {
      'title': 'Eesti juriidilisest isikust registreerijate jaotuse tüübiline koosseis',
      'legend_title': 'Registreerijate arv',
      't1': 'Äriühing',
      't7': 'Riigiasutus',
      't8': 'MTÜ',
      't9': 'SA',
    },
    'sex_chart': {
      'men': 'Men',
      'women': 'Women',
      'title': 'Registrations by gender (male/female) and age',
      'registered_domains': 'Registered domains',
      'gender_composition': 'Gender composition',
      'age_group': 'year born',
      'total_domains': 'Total of domains',
      'total': 'Total'
    },
    'months': [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december'
    ],
    'domains': {
      'dnssec_signed': 'Signed',
      'dnssec_unsigned': 'Not Signed',
      "ok (paid and in zone)": 'is registered',
      "expired": "is expired",
      "serverHold": 'is on hold',
      "serverRenewProhibited": 'renewal is prohibited',
      "serverTransferProhibited": 'transfer is prohibited',
      "serverRegistrantChangeProhibited": 'registrant change is prohibited',
      "serverAdminChangeProhibited": 'admin change is prohibited',
      "serverTechChangeProhibited": 'tech change is prohibited',
      "serverUpdateProhibited": 'update is prohibited',
      "serverDeleteProhibited": 'delete is prohibited',
      "serverForceDelete": 'is forced to delete',
      "pendingUpdate": 'has pending update',
      "pendingDelete": 'has pending delete',
      "serverManualInzone": 'is kept in zone',
      "Blocked": 'is blocked',
      "Reserved": 'is reserved',
      "inactive": 'is inactive',
      "deleteCandidate": 'will be deleted',
      "pendingDeleteConfirmation": 'has pending delete confirmation',
      "pendingRenew": 'has pending renewal',
      "pendingTransfer": 'has pending registrant change',
      "pendingCreate": 'is being created',
    },
    'domainstatuses': {
      'dnssec_signed': 'Signed',
      'dnssec_unsigned': 'Not Signed',
      "ok (paid and in zone)": 'OK',
      "expired": "Expired",
      "serverHold": 'on Hold',
      "serverRenewProhibited": 'Renew Prohibited',
      "serverTransferProhibited": 'Transfer Prohibited',
      "serverRegistrantChangeProhibited": 'Registrant Change Prohibited',
      "serverAdminChangeProhibited": 'Admin Change Prohibited',
      "serverTechChangeProhibited": 'Tech Change Prohibited',
      "serverUpdateProhibited": 'Update Prohibited',
      "serverDeleteProhibited": 'Delete Prohibited',
      "serverForceDelete": 'Forced to Delete',
      "pendingUpdate": 'Pending Update',
      "pendingDelete": 'Pending Delete',
      "serverManualInzone": 'Kept in Zone',
      "Blocked": 'Blocked',
      "Reserved": 'Reserved',
      "inactive": 'Inactive',
      "deleteCandidate": 'Will be Deleted'
    },
    'search': {
      'pages': 'Pages',
      'articles': 'Articles'
    },
    'upload': {
      'add_file': 'Add file',
      'remove_file': 'Remove file'
    }
    {% endcase %}
  }
</script>