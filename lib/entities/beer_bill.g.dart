// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'beer_bill.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters

extension GetBeerBillCollection on Isar {
  IsarCollection<BeerBill> get beerBills => this.collection();
}

const BeerBillSchema = CollectionSchema(
  name: r'BeerBill',
  id: 7280293423650126688,
  properties: {},
  estimateSize: _beerBillEstimateSize,
  serialize: _beerBillSerialize,
  deserialize: _beerBillDeserialize,
  deserializeProp: _beerBillDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {
    r'bill': LinkSchema(
      id: 4155707055512975553,
      name: r'bill',
      target: r'Bill',
      single: true,
    ),
    r'beer': LinkSchema(
      id: 5707464431473688001,
      name: r'beer',
      target: r'Beer',
      single: true,
    )
  },
  embeddedSchemas: {},
  getId: _beerBillGetId,
  getLinks: _beerBillGetLinks,
  attach: _beerBillAttach,
  version: '3.0.5',
);

int _beerBillEstimateSize(
  BeerBill object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _beerBillSerialize(
  BeerBill object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {}
BeerBill _beerBillDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BeerBill();
  object.id = id;
  return object;
}

P _beerBillDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _beerBillGetId(BeerBill object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _beerBillGetLinks(BeerBill object) {
  return [object.bill, object.beer];
}

void _beerBillAttach(IsarCollection<dynamic> col, Id id, BeerBill object) {
  object.id = id;
  object.bill.attach(col, col.isar.collection<Bill>(), r'bill', id);
  object.beer.attach(col, col.isar.collection<Beer>(), r'beer', id);
}

extension BeerBillQueryWhereSort on QueryBuilder<BeerBill, BeerBill, QWhere> {
  QueryBuilder<BeerBill, BeerBill, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BeerBillQueryWhere on QueryBuilder<BeerBill, BeerBill, QWhereClause> {
  QueryBuilder<BeerBill, BeerBill, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<BeerBill, BeerBill, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterWhereClause> idBetween(
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

extension BeerBillQueryFilter
    on QueryBuilder<BeerBill, BeerBill, QFilterCondition> {
  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> idBetween(
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

extension BeerBillQueryObject
    on QueryBuilder<BeerBill, BeerBill, QFilterCondition> {}

extension BeerBillQueryLinks
    on QueryBuilder<BeerBill, BeerBill, QFilterCondition> {
  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> bill(
      FilterQuery<Bill> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'bill');
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> billIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'bill', 0, true, 0, true);
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> beer(
      FilterQuery<Beer> q) {
    return QueryBuilder.apply(this, (query) {
      return query.link(q, r'beer');
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterFilterCondition> beerIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.linkLength(r'beer', 0, true, 0, true);
    });
  }
}

extension BeerBillQuerySortBy on QueryBuilder<BeerBill, BeerBill, QSortBy> {}

extension BeerBillQuerySortThenBy
    on QueryBuilder<BeerBill, BeerBill, QSortThenBy> {
  QueryBuilder<BeerBill, BeerBill, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BeerBill, BeerBill, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension BeerBillQueryWhereDistinct
    on QueryBuilder<BeerBill, BeerBill, QDistinct> {}

extension BeerBillQueryProperty
    on QueryBuilder<BeerBill, BeerBill, QQueryProperty> {
  QueryBuilder<BeerBill, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
