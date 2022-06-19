const String getWiki =
    '''resource/Wiki?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]''';
const String serviceWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Services"]]''';
const String membershipWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Memberships"]]''';
const String discountWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Discounts"]]''';
const String loginRoute = '''method/login''';
const String baseUrl = '''https://beta.afms.com.ph/api''';
const String getMemberProfile =
    '''resource/Member?fields=["name","date_joined","first_name","last_name","frappe_user","phone","full_address","middle_name"]''';
const String insuranceWiki =
    '''resource/Wiki/?fields=["name","title","content","published","available_to_members","wiki_type","footnotes"]&filters=[["wiki_type","=","Insurance"]]''';

const String getOfferedServicesurl =
    '''resource/Service?fields=["name","title","published","description","author","creation","terms_and_conditions","type","roi_percentage_on_capital_investment","fixed_return_amount","has_fixed_return","tenure_length_months"]''';
const String contactInfoFetchedMember =
    '''resource/Member?fields=["first_name","last_name","frappe_user","phone"]&filters=[["first_name","=","Adam"]]''';
const String GET_notifications =
    '''resource/Notification Log?fields=["name","subject","email_content","for_user","type","read","from_user","creation"]''';
const String GET_equity_sharing_form = "resource/Equity Sharing Form";
