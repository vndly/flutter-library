import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers.dart';

class StickyHeadersScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final countriesMap = _countriesMap();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Sticky Headers'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            final key = countriesMap.keys.toList()[index];
            final countries = countriesMap[key];

            return ItemsGroup(key, countries);
          },
          itemCount: countriesMap.keys.length,
        ));
  }

  List<String> _countries() => [
        'Afghanistan',
        'Albania',
        'Algeria',
        'Andorra',
        'Angola',
        'Antigua and Barbuda',
        'Argentina',
        'Armenia',
        'Australia',
        'Austria',
        'Azerbaijan',
        'Bahamas',
        'Bahrain',
        'Bangladesh',
        'Barbados',
        'Belarus',
        'Belgium',
        'Belize',
        'Benin',
        'Bhutan',
        'Bolivia',
        'Bosnia and Herzegovina',
        'Botswana',
        'Brazil',
        'Brunei',
        'Bulgaria',
        'Burkina Faso',
        'Burundi',
        'Cabo Verde',
        'Cambodia',
        'Cameroon',
        'Canada',
        'Central African Republic',
        'Chad',
        'Chile',
        'China',
        'Colombia',
        'Comoros',
        'Congo, Democratic Republic of the',
        'Congo, Republic of the',
        'Costa Rica',
        'Côte d’Ivoire',
        'Croatia',
        'Cuba',
        'Cyprus',
        'Czech Republic',
        'Denmark',
        'Djibouti',
        'Dominica',
        'Dominican Republic',
        'East Timor (Timor-Leste)',
        'Ecuador',
        'Egypt',
        'El Salvador',
        'Equatorial Guinea',
        'Eritrea',
        'Estonia',
        'Eswatini',
        'Ethiopia',
        'Fiji',
        'Finland',
        'France',
        'Gabon',
        'Gambia',
        'Georgia',
        'Germany',
        'Ghana',
        'Greece',
        'Grenada',
        'Guatemala',
        'Guinea',
        'Guinea-Bissau',
        'Guyana',
        'Haiti',
        'Honduras',
        'Hungary',
        'Iceland',
        'India',
        'Indonesia',
        'Iran',
        'Iraq',
        'Ireland',
        'Israel',
        'Italy',
        'Jamaica',
        'Japan',
        'Jordan',
        'Kazakhstan',
        'Kenya',
        'Kiribati',
        'Korea, North',
        'Korea, South',
        'Kosovo',
        'Kuwait',
        'Kyrgyzstan',
        'Laos',
        'Latvia',
        'Lebanon',
        'Lesotho',
        'Liberia',
        'Libya',
        'Liechtenstein',
        'Lithuania',
        'Luxembourg',
        'Madagascar',
        'Malawi',
        'Malaysia',
        'Maldives',
        'Mali',
        'Malta',
        'Marshall Islands',
        'Mauritania',
        'Mauritius',
        'Mexico',
        'Micronesia, Federated States of',
        'Moldova',
        'Monaco',
        'Mongolia',
        'Montenegro',
        'Morocco',
        'Mozambique',
        'Myanmar (Burma)',
        'Namibia',
        'Nauru',
        'Nepal',
        'Netherlands',
        'New Zealand',
        'Nicaragua',
        'Niger',
        'Nigeria',
        'North Macedonia',
        'Norway',
        'Oman',
        'Pakistan',
        'Palau',
        'Panama',
        'Papua New Guinea',
        'Paraguay',
        'Peru',
        'Philippines',
        'Poland',
        'Portugal',
        'Qatar',
        'Romania',
        'Russia',
        'Rwanda',
        'Saint Kitts and Nevis',
        'Saint Lucia',
        'Saint Vincent and the Grenadines',
        'Samoa',
        'San Marino',
        'Sao Tome and Principe',
        'Saudi Arabia',
        'Senegal',
        'Serbia',
        'Seychelles',
        'Sierra Leone',
        'Singapore',
        'Slovakia',
        'Slovenia',
        'Solomon Islands',
        'Somalia',
        'South Africa',
        'Spain',
        'Sri Lanka',
        'Sudan',
        'Sudan, South',
        'Suriname',
        'Sweden',
        'Switzerland',
        'Syria',
        'Taiwan',
        'Tajikistan',
        'Tanzania',
        'Thailand',
        'Togo',
        'Tonga',
        'Trinidad and Tobago',
        'Tunisia',
        'Turkey',
        'Turkmenistan',
        'Tuvalu',
        'Uganda',
        'Ukraine',
        'United Arab Emirates',
        'United Kingdom',
        'United States',
        'Uruguay',
        'Uzbekistan',
        'Vanuatu',
        'Vatican City',
        'Venezuela',
        'Vietnam',
        'Yemen',
        'Zambia',
        'Zimbabwe',
      ];

  Map<String, List<String>> _countriesMap() {
    final Map<String, List<String>> result = {};
    final list = _countries();
    var group = '';

    for (var country in list) {
      final letter = country[0];

      if (group != letter) {
        group = letter;
        result[group] = [];
      }

      result[group].add(country);
    }

    return result;
  }
}

class ItemsGroup extends StatelessWidget {
  final String header;
  final List<String> countries;

  const ItemsGroup(this.header, this.countries);

  @override
  Widget build(BuildContext context) {
    return StickyHeader(
      header: Container(
        height: 50.0,
        color: Colors.grey[500],
        padding: const EdgeInsets.all(15),
        alignment: Alignment.centerLeft,
        child: Text(
          header,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      content: Column(
        children: countries.map((c) => RowItem(c)).toList(),
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  final String country;

  const RowItem(this.country);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(country),
      ),
      onTap: () => print(country),
    );
  }
}
