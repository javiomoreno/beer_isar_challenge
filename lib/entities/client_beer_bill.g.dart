// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'client_beer_bill.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetClientBeerBillCollection on Isar {
  IsarCollection<ClientBeerBill> get clientBeerBills => this.collection();
}

const ClientBeerBillSchema = CollectionSchema(
  name: r'ClientBeerBill',
  id: 5130797839317036508,
  properties: {
    r'cant': PropertySchema(
      id: 0,
      name: r'cant',
      type: IsarType.long,
    )
  },
  estimateSize: _clientBeerBillEstimateSize,
  serialize: _clientBeerBillSerialize,
  deserialize: _clientBeerBillDeserialize,
  deserializeProp: _clientBeerBillDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'client': LinkSchema(
      id: 4386174212409608570,
      name: r'client',
      target: r'Client',
      single: true,
    ),
    r'beerBill': LinkSchema(
      id: -3676160572792974433,
      name: r'beerBill',
      target: r'BeerBill',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _clientBeerBillGetId,
  getLinks: _clientBeerBillGetLinks,
  attach: _clientBeerBillAttach,
  version: '3.0.5',
);

int _clientBeerBillEstimateSize(
  ClientBeerBill object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _clientBeerBillSerialize(
  ClientBeerBill object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.cant);
}

ClientBeerBill _clientBeerBillDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ClientBeerBill();
  object.cant = reader.readLong(offsets[0]);
  object.id = id;
  return object;
}

P _clientBeerBillDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _clientBeerBillGetId(ClientBeerBill object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _clientBeerBillGetLinks(ClientBeerBill object) {
  return [object.client, object.beerBill];
}

void _clientBeerBillAttach(
    IsarCollection<dynamic> col, Id id, ClientBeerBill object) {
  object.id = id;
  object.client.attach(col, col.isar.collection<Client>(), r'client', id);
  object.beerBill.attach(col, col.isar.collection<BeerBill>(), r'beerBill', id);
}

extension ClientBeerBillQueryWhereSort
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QWhere> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension ClientBeerBillQueryWhere
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QWhereClause> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClientBeerBillQueryFilter
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QFilterCondition> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      cantEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cant',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      cantGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'cant',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      cantLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'cant',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      cantBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'cant',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension ClientBeerBillQueryObject
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QFilterCondition> {}

extension ClientBeerBillQueryLinks
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QFilterCondition> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition> client(
      FilterQuery<Client> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'client');
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      clientIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'client', 0, true, 0, true);
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition> beerBill(
      FilterQuery<BeerBill> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'beerBill');
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterFilterCondition>
      beerBillIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'beerBill', 0, true, 0, true);
    });
  }
}

extension ClientBeerBillQuerySortBy
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QSortBy> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> sortByCant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cant', Sort.asc);
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> sortByCantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cant', Sort.desc);
    });
  }
}

extension ClientBeerBillQuerySortThenBy
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QSortThenBy> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> thenByCant() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cant', Sort.asc);
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> thenByCantDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cant', Sort.desc);
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ClientBeerBill, ClientBeerBill, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension ClientBeerBillQueryWhereDistinct
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QDistinct> {
  QueryBuilder<ClientBeerBill, ClientBeerBill, QDistinct> distinctByCant() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cant');
    });
  }
}

extension ClientBeerBillQueryProperty
    on QueryBuilder<ClientBeerBill, ClientBeerBill, QQueryProperty> {
  QueryBuilder<ClientBeerBill, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ClientBeerBill, int, QQueryOperations> cantProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cant');
    });
  }
}
