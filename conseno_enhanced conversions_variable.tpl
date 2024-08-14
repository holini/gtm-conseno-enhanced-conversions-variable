___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Conseno - Enhanced Conversions - variable",
  "description": "This custom variable helps configure Google Enhanced Conversions.",
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "LABEL",
    "name": "clarificationText",
    "displayName": "\u003cstrong\u003eKeep in mind:\u003c/strong\u003e At least one of the following fields must be provided:\n\u003cbr\u003e\n\u003cbr\u003e\na) \u003cstrong\u003eEmail\u003c/strong\u003e - email address can also be provided as a standalone match key (preferred)\n\u003cbr\u003e\nb) \u003cstrong\u003ePhone\u003c/strong\u003e - phone number can also be provided as a standalone match key but is recommended to be sent along with an email.\n\u003cbr\u003e\nc) \u003cstrong\u003eName and Address\u003c/strong\u003e - If you choose to provide any of the following match keys: first name, last name, country, or postal code, then you must include all four of them. You can optionally provide region, city, and street address as extra match keys.\n\u003cbr\u003e\n\u003cbr\u003e\nRefer to the \u003ca href\u003d\"https://support.google.com/google-ads/answer/13262500?hl\u003den\" target\u003d\"_blank\" rel\u003d\"noopener noreferrer\"\u003eofficial Google documentation\u003c/a\u003e for more details.\n\u003cbr\u003e\n\u003cbr\u003e"
  },
  {
    "type": "TEXT",
    "name": "consentVariable",
    "displayName": "Select the consent variable",
    "simpleValueType": true,
    "alwaysInSummary": true,
    "help": "Select a GTM variable that returns the consent decision, either true or false (boolean or string).",
    "notSetText": "Not set"
  },
  {
    "type": "SELECT",
    "name": "customerEmail",
    "displayName": "Email",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "help": "Specify a variable that refers to your users\u0027 email address. Example: \u0027john.smith@company.com\u0027 (string)",
    "notSetText": "Not set",
    "alwaysInSummary": true
  },
  {
    "type": "SELECT",
    "name": "customerPhone",
    "displayName": "Phone",
    "macrosInSelect": true,
    "selectItems": [],
    "simpleValueType": true,
    "help": "User phone number (string). Must be in E.164 format, which means it must be 11 to 15 digits including a plus sign (+) prefix and country code with no dashes, parentheses, or spaces. Example: \u0027+37255449854\u0027 (string)",
    "notSetText": "Not set",
    "alwaysInSummary": true
  },
  {
    "type": "GROUP",
    "name": "customerNameAddress",
    "displayName": "Name and Address",
    "groupStyle": "ZIPPY_OPEN",
    "subParams": [
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerFirstName",
        "displayName": "First Name",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User first name. Example: \u0027John\u0027 (string)"
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerLastName",
        "displayName": "Last Name",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User last name. Example: \u0027Smith\u0027 (string)"
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerCountry",
        "displayName": "Country",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User country code. Example: \u0027UK\u0027 (string). Use 2-letter country codes, per the ISO 3166-1 alpha-2 standard."
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerPostalCode",
        "displayName": "Postal Code",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User post code. Example: \u0027SO99 9XX\u0027 (string)"
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerRegion",
        "displayName": "Region",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User province, state, or region. Example: \u0027Hampshire\u0027 (string)"
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerCity",
        "displayName": "City",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User city name. Example: \u0027Southampton\u0027 (string)"
      },
      {
        "type": "SELECT",
        "name": "customerNameAddress_CustomerStreet",
        "displayName": "Street",
        "macrosInSelect": true,
        "selectItems": [],
        "simpleValueType": true,
        "notSetText": "Not set",
        "alwaysInSummary": true,
        "help": "User street address. Example: \u0027123 New Rd\u0027 (string)"
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

let consentVariable = data.consentVariable; // this value should be either true or false (boolean)
const Object = require('Object');

// Helper function to clean up the data
function cleanData(value) {
    if (typeof value === 'string') {
        return value.trim().toLowerCase();
    }
    return value; // return as is if not a string
}

let email = cleanData(data.customerEmail);
let phone_number = cleanData(data.customerPhone);
let first_name = cleanData(data.customerNameAddress_CustomerFirstName);
let last_name = cleanData(data.customerNameAddress_CustomerLastName);
let street = cleanData(data.customerNameAddress_CustomerStreet);
let city = cleanData(data.customerNameAddress_CustomerCity);
let region = cleanData(data.customerNameAddress_CustomerRegion);
let postal_code = cleanData(data.customerNameAddress_PostalCode);
let country = cleanData(data.customerNameAddress_CustomerCountry);

// Check if consentVariable is boolean or not
if (typeof consentVariable !== 'boolean') {
    // If consentVariable is a string, check if it's "true" or "false"
    if (typeof consentVariable === 'string') {
        consentVariable = consentVariable.trim().toLowerCase();
        if (consentVariable === 'true') {
            consentVariable = true;
        } else if (consentVariable === 'false') {
            consentVariable = false;
        } else {
            return; // If the string is neither "true" nor "false", exit the function
        }
    } else {
        return; // If consentVariable is not a boolean or a valid string, exit the function
    }
}

// If consentVariable is true, proceed with creating the return object
if (consentVariable === true) {
    let returnObject = {};

    // Add non-undefined variables to return object
    if (email !== undefined) returnObject.email = email;
    if (phone_number !== undefined) returnObject.phone_number = phone_number;

    let address = {};
    if (first_name !== undefined) address.first_name = first_name;
    if (last_name !== undefined) address.last_name = last_name;
    if (street !== undefined) address.street = street;
    if (city !== undefined) address.city = city;
    if (region !== undefined) address.region = region;
    if (postal_code !== undefined) address.postal_code = postal_code;
    if (country !== undefined) address.country = country;

    // If any address field is present, add the address object to return object
    if (Object.keys(address).length > 0) {
        returnObject.address = address;
    }
    return returnObject;

// If consentVariable is false, or any other value, just return
} else {
    return;
}


___TESTS___

scenarios: []


___NOTES___

Created on 10/05/2024, 22:37:27
