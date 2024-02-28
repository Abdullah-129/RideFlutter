import { gql } from 'apollo-angular';
import { Injectable } from '@angular/core';
import * as Apollo from 'apollo-angular';
export type Maybe<T> = T | null;
export type InputMaybe<T> = Maybe<T>;
export type Exact<T extends { [key: string]: unknown }> = { [K in keyof T]: T[K] };
export type MakeOptional<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]?: Maybe<T[SubKey]> };
export type MakeMaybe<T, K extends keyof T> = Omit<T, K> & { [SubKey in K]: Maybe<T[SubKey]> };
/** All built-in and custom scalars, mapped to their actual values */
export type Scalars = {
  ID: string;
  String: string;
  Boolean: boolean;
  Int: number;
  Float: number;
  /** Cursor for paging through collections */
  ConnectionCursor: any;
  /** A date-time string at UTC, such as 2019-12-03T09:54:33Z, compliant with the date-time format. */
  DateTime: any;
};

export type AddActivitiesToComplaintInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddActivitiesToDistressSignalInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddAddressesToRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddAllowedServicesToCouponInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddComplaintsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddConversationsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddDocumentsToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddDriverTransactionsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddEnabledServicesToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddFeedbacksToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddFleetTransactionsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddFleetsToZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddOptionsToServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddOrdersToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddOrdersToRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddParametersToFeedbackInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddProviderTransactionsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddRegionsToServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddRiderTransactionsToOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddServicesToServiceCategoryInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddServicesToZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddTransactionsToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddTransactionsToFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddTransactionsToRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddWalletsToDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddWalletsToFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddWalletsToRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type AddZonePricesToFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type Address = {
  __typename?: 'Address';
  details?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  location: Point;
  title: Scalars['String'];
};

export type AddressAggregateGroupBy = {
  __typename?: 'AddressAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type AddressAvgAggregate = {
  __typename?: 'AddressAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type AddressConnection = {
  __typename?: 'AddressConnection';
  /** Array of edges. */
  edges: Array<AddressEdge>;
  /** Paging information */
  pageInfo: PageInfo;
};

export type AddressCountAggregate = {
  __typename?: 'AddressCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type AddressEdge = {
  __typename?: 'AddressEdge';
  /** Cursor for this node. */
  cursor: Scalars['ConnectionCursor'];
  /** The node containing the Address */
  node: Address;
};

export type AddressFilter = {
  and?: InputMaybe<Array<AddressFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<AddressFilter>>;
};

export type AddressMaxAggregate = {
  __typename?: 'AddressMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type AddressMinAggregate = {
  __typename?: 'AddressMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type AddressSort = {
  direction: SortDirection;
  field: AddressSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum AddressSortFields {
  Id = 'id'
}

export type AddressSumAggregate = {
  __typename?: 'AddressSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type Announcement = {
  __typename?: 'Announcement';
  description: Scalars['String'];
  expireAt: Scalars['DateTime'];
  id: Scalars['ID'];
  startAt: Scalars['DateTime'];
  title: Scalars['String'];
  url?: Maybe<Scalars['String']>;
  userType: Array<AnnouncementUserType>;
};

export type AnnouncementAggregateGroupBy = {
  __typename?: 'AnnouncementAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type AnnouncementAvgAggregate = {
  __typename?: 'AnnouncementAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type AnnouncementConnection = {
  __typename?: 'AnnouncementConnection';
  /** Array of nodes. */
  nodes: Array<Announcement>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type AnnouncementCountAggregate = {
  __typename?: 'AnnouncementCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type AnnouncementDeleteResponse = {
  __typename?: 'AnnouncementDeleteResponse';
  description?: Maybe<Scalars['String']>;
  expireAt?: Maybe<Scalars['DateTime']>;
  id?: Maybe<Scalars['ID']>;
  startAt?: Maybe<Scalars['DateTime']>;
  title?: Maybe<Scalars['String']>;
  url?: Maybe<Scalars['String']>;
  userType?: Maybe<Array<AnnouncementUserType>>;
};

export type AnnouncementFilter = {
  and?: InputMaybe<Array<AnnouncementFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<AnnouncementFilter>>;
};

export type AnnouncementMaxAggregate = {
  __typename?: 'AnnouncementMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type AnnouncementMinAggregate = {
  __typename?: 'AnnouncementMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type AnnouncementSort = {
  direction: SortDirection;
  field: AnnouncementSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum AnnouncementSortFields {
  Id = 'id'
}

export type AnnouncementSumAggregate = {
  __typename?: 'AnnouncementSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum AnnouncementUserType {
  Driver = 'Driver',
  Operator = 'Operator',
  Rider = 'Rider'
}

export type BooleanFieldComparison = {
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
};

export type CalculateFareDto = {
  __typename?: 'CalculateFareDTO';
  currency: Scalars['String'];
  distance: Scalars['Float'];
  duration: Scalars['Float'];
  error?: Maybe<CalculateFareError>;
  services: Array<ServiceCategoryWithCost>;
};

export enum CalculateFareError {
  NoServiceInRegion = 'NoServiceInRegion',
  RegionUnsupported = 'RegionUnsupported'
}

export type CalculateFareInput = {
  points: Array<PointInput>;
};

export type CarColor = {
  __typename?: 'CarColor';
  id: Scalars['ID'];
  name: Scalars['String'];
};

export type CarColorAggregateGroupBy = {
  __typename?: 'CarColorAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type CarColorAvgAggregate = {
  __typename?: 'CarColorAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type CarColorCountAggregate = {
  __typename?: 'CarColorCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type CarColorDeleteResponse = {
  __typename?: 'CarColorDeleteResponse';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type CarColorFilter = {
  and?: InputMaybe<Array<CarColorFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<CarColorFilter>>;
};

export type CarColorMaxAggregate = {
  __typename?: 'CarColorMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CarColorMinAggregate = {
  __typename?: 'CarColorMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CarColorSort = {
  direction: SortDirection;
  field: CarColorSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum CarColorSortFields {
  Id = 'id'
}

export type CarColorSumAggregate = {
  __typename?: 'CarColorSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type CarModel = {
  __typename?: 'CarModel';
  id: Scalars['ID'];
  name: Scalars['String'];
};

export type CarModelAggregateGroupBy = {
  __typename?: 'CarModelAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type CarModelAvgAggregate = {
  __typename?: 'CarModelAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type CarModelConnection = {
  __typename?: 'CarModelConnection';
  /** Array of nodes. */
  nodes: Array<CarModel>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type CarModelCountAggregate = {
  __typename?: 'CarModelCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type CarModelDeleteResponse = {
  __typename?: 'CarModelDeleteResponse';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type CarModelFilter = {
  and?: InputMaybe<Array<CarModelFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<CarModelFilter>>;
};

export type CarModelMaxAggregate = {
  __typename?: 'CarModelMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CarModelMinAggregate = {
  __typename?: 'CarModelMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CarModelSort = {
  direction: SortDirection;
  field: CarModelSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum CarModelSortFields {
  Id = 'id'
}

export type CarModelSumAggregate = {
  __typename?: 'CarModelSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum ChartTimeframe {
  Daily = 'Daily',
  Monthly = 'Monthly',
  Weekly = 'Weekly',
  Yearly = 'Yearly'
}

export type Complaint = {
  __typename?: 'Complaint';
  activities: Array<ComplaintActivity>;
  activitiesAggregate: Array<ComplaintActivitiesAggregateResponse>;
  content?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  inscriptionTimestamp: Scalars['DateTime'];
  order: Order;
  requestId: Scalars['ID'];
  requestedByDriver: Scalars['Boolean'];
  status: ComplaintStatus;
  subject: Scalars['String'];
};


export type ComplaintActivitiesArgs = {
  filter?: InputMaybe<ComplaintActivityFilter>;
  sorting?: InputMaybe<Array<ComplaintActivitySort>>;
};


export type ComplaintActivitiesAggregateArgs = {
  filter?: InputMaybe<ComplaintActivityAggregateFilter>;
};

export type ComplaintActivitiesAggregateGroupBy = {
  __typename?: 'ComplaintActivitiesAggregateGroupBy';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivitiesAggregateResponse = {
  __typename?: 'ComplaintActivitiesAggregateResponse';
  avg?: Maybe<ComplaintActivitiesAvgAggregate>;
  count?: Maybe<ComplaintActivitiesCountAggregate>;
  groupBy?: Maybe<ComplaintActivitiesAggregateGroupBy>;
  max?: Maybe<ComplaintActivitiesMaxAggregate>;
  min?: Maybe<ComplaintActivitiesMinAggregate>;
  sum?: Maybe<ComplaintActivitiesSumAggregate>;
};

export type ComplaintActivitiesAvgAggregate = {
  __typename?: 'ComplaintActivitiesAvgAggregate';
  complaintId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ComplaintActivitiesCountAggregate = {
  __typename?: 'ComplaintActivitiesCountAggregate';
  complaintId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type ComplaintActivitiesMaxAggregate = {
  __typename?: 'ComplaintActivitiesMaxAggregate';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivitiesMinAggregate = {
  __typename?: 'ComplaintActivitiesMinAggregate';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivitiesSumAggregate = {
  __typename?: 'ComplaintActivitiesSumAggregate';
  complaintId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ComplaintActivity = {
  __typename?: 'ComplaintActivity';
  actor: Operator;
  assignedTo?: Maybe<Operator>;
  comment?: Maybe<Scalars['String']>;
  complaintId: Scalars['ID'];
  id: Scalars['ID'];
  type: ComplaintActivityType;
};

export type ComplaintActivityAggregateFilter = {
  and?: InputMaybe<Array<ComplaintActivityAggregateFilter>>;
  complaintId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ComplaintActivityAggregateFilter>>;
};

export type ComplaintActivityAggregateGroupBy = {
  __typename?: 'ComplaintActivityAggregateGroupBy';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivityAvgAggregate = {
  __typename?: 'ComplaintActivityAvgAggregate';
  complaintId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ComplaintActivityCountAggregate = {
  __typename?: 'ComplaintActivityCountAggregate';
  complaintId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type ComplaintActivityFilter = {
  and?: InputMaybe<Array<ComplaintActivityFilter>>;
  complaintId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ComplaintActivityFilter>>;
};

export type ComplaintActivityMaxAggregate = {
  __typename?: 'ComplaintActivityMaxAggregate';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivityMinAggregate = {
  __typename?: 'ComplaintActivityMinAggregate';
  complaintId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ComplaintActivitySort = {
  direction: SortDirection;
  field: ComplaintActivitySortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ComplaintActivitySortFields {
  ComplaintId = 'complaintId',
  Id = 'id'
}

export type ComplaintActivitySumAggregate = {
  __typename?: 'ComplaintActivitySumAggregate';
  complaintId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export enum ComplaintActivityType {
  AssignToOperator = 'AssignToOperator',
  Resolved = 'Resolved',
  Update = 'Update'
}

export type ComplaintAggregateFilter = {
  and?: InputMaybe<Array<ComplaintAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ComplaintAggregateFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
  status?: InputMaybe<ComplaintStatusFilterComparison>;
};

export type ComplaintAggregateGroupBy = {
  __typename?: 'ComplaintAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type ComplaintAggregateResponse = {
  __typename?: 'ComplaintAggregateResponse';
  avg?: Maybe<ComplaintAvgAggregate>;
  count?: Maybe<ComplaintCountAggregate>;
  groupBy?: Maybe<ComplaintAggregateGroupBy>;
  max?: Maybe<ComplaintMaxAggregate>;
  min?: Maybe<ComplaintMinAggregate>;
  sum?: Maybe<ComplaintSumAggregate>;
};

export type ComplaintAvgAggregate = {
  __typename?: 'ComplaintAvgAggregate';
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type ComplaintConnection = {
  __typename?: 'ComplaintConnection';
  /** Array of nodes. */
  nodes: Array<Complaint>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type ComplaintCountAggregate = {
  __typename?: 'ComplaintCountAggregate';
  id?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
  status?: Maybe<Scalars['Int']>;
};

export type ComplaintFilter = {
  and?: InputMaybe<Array<ComplaintFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ComplaintFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
  status?: InputMaybe<ComplaintStatusFilterComparison>;
};

export type ComplaintMaxAggregate = {
  __typename?: 'ComplaintMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type ComplaintMinAggregate = {
  __typename?: 'ComplaintMinAggregate';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type ComplaintSort = {
  direction: SortDirection;
  field: ComplaintSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ComplaintSortFields {
  Id = 'id',
  RequestId = 'requestId',
  Status = 'status'
}

export enum ComplaintStatus {
  Resolved = 'Resolved',
  Submitted = 'Submitted',
  UnderInvestigation = 'UnderInvestigation'
}

export type ComplaintStatusFilterComparison = {
  eq?: InputMaybe<ComplaintStatus>;
  gt?: InputMaybe<ComplaintStatus>;
  gte?: InputMaybe<ComplaintStatus>;
  iLike?: InputMaybe<ComplaintStatus>;
  in?: InputMaybe<Array<ComplaintStatus>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  like?: InputMaybe<ComplaintStatus>;
  lt?: InputMaybe<ComplaintStatus>;
  lte?: InputMaybe<ComplaintStatus>;
  neq?: InputMaybe<ComplaintStatus>;
  notILike?: InputMaybe<ComplaintStatus>;
  notIn?: InputMaybe<Array<ComplaintStatus>>;
  notLike?: InputMaybe<ComplaintStatus>;
};

export type ComplaintSumAggregate = {
  __typename?: 'ComplaintSumAggregate';
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type Coupon = {
  __typename?: 'Coupon';
  allowedServices: Array<Service>;
  code: Scalars['String'];
  creditGift: Scalars['Float'];
  description: Scalars['String'];
  discountFlat: Scalars['Int'];
  discountPercent: Scalars['Int'];
  expireAt: Scalars['DateTime'];
  id: Scalars['ID'];
  isEnabled: Scalars['Boolean'];
  isFirstTravelOnly: Scalars['Boolean'];
  manyTimesUserCanUse: Scalars['Int'];
  manyUsersCanUse: Scalars['Int'];
  maximumCost: Scalars['Float'];
  minimumCost: Scalars['Float'];
  startAt: Scalars['DateTime'];
  title: Scalars['String'];
};


export type CouponAllowedServicesArgs = {
  filter?: InputMaybe<ServiceFilter>;
  sorting?: InputMaybe<Array<ServiceSort>>;
};

export type CouponAggregateGroupBy = {
  __typename?: 'CouponAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type CouponAvgAggregate = {
  __typename?: 'CouponAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type CouponConnection = {
  __typename?: 'CouponConnection';
  /** Array of nodes. */
  nodes: Array<Coupon>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type CouponCountAggregate = {
  __typename?: 'CouponCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type CouponFilter = {
  and?: InputMaybe<Array<CouponFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<CouponFilter>>;
};

export type CouponMaxAggregate = {
  __typename?: 'CouponMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CouponMinAggregate = {
  __typename?: 'CouponMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type CouponSort = {
  direction: SortDirection;
  field: CouponSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum CouponSortFields {
  Id = 'id'
}

export type CouponSumAggregate = {
  __typename?: 'CouponSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type CreateAnnouncement = {
  description?: InputMaybe<Scalars['String']>;
  expireAt?: InputMaybe<Scalars['DateTime']>;
  id?: InputMaybe<Scalars['ID']>;
  startAt?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
  url?: InputMaybe<Scalars['String']>;
  userType?: InputMaybe<Array<AnnouncementUserType>>;
};

export type CreateCarColor = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type CreateCarModel = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type CreateComplaintActivity = {
  comment?: InputMaybe<Scalars['String']>;
  complaintId?: InputMaybe<Scalars['ID']>;
  id?: InputMaybe<Scalars['ID']>;
  type?: InputMaybe<ComplaintActivityType>;
};

export type CreateCoupon = {
  code?: InputMaybe<Scalars['String']>;
  creditGift?: InputMaybe<Scalars['Float']>;
  description?: InputMaybe<Scalars['String']>;
  discountFlat?: InputMaybe<Scalars['Int']>;
  discountPercent?: InputMaybe<Scalars['Int']>;
  expireAt?: InputMaybe<Scalars['DateTime']>;
  id?: InputMaybe<Scalars['ID']>;
  isEnabled?: InputMaybe<Scalars['Boolean']>;
  isFirstTravelOnly?: InputMaybe<Scalars['Boolean']>;
  manyTimesUserCanUse?: InputMaybe<Scalars['Int']>;
  manyUsersCanUse?: InputMaybe<Scalars['Int']>;
  maximumCost?: InputMaybe<Scalars['Float']>;
  minimumCost?: InputMaybe<Scalars['Float']>;
  startAt?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
};

export type CreateDriver = {
  accountNumber?: InputMaybe<Scalars['String']>;
  address?: InputMaybe<Scalars['String']>;
  bankName?: InputMaybe<Scalars['String']>;
  bankRoutingNumber?: InputMaybe<Scalars['String']>;
  bankSwift?: InputMaybe<Scalars['String']>;
  carColorId?: InputMaybe<Scalars['ID']>;
  carId?: InputMaybe<Scalars['ID']>;
  carPlate?: InputMaybe<Scalars['String']>;
  carProductionYear?: InputMaybe<Scalars['Int']>;
  certificateNumber?: InputMaybe<Scalars['String']>;
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  fleetId?: InputMaybe<Scalars['ID']>;
  gender?: InputMaybe<Gender>;
  id?: InputMaybe<Scalars['ID']>;
  lastName?: InputMaybe<Scalars['String']>;
  lastSeenTimestamp?: InputMaybe<Scalars['DateTime']>;
  mediaId?: InputMaybe<Scalars['ID']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  rating?: InputMaybe<Scalars['Float']>;
  registrationTimestamp?: InputMaybe<Scalars['DateTime']>;
  reviewCount?: InputMaybe<Scalars['Float']>;
  softRejectionNote?: InputMaybe<Scalars['String']>;
  status?: InputMaybe<DriverStatus>;
};

export type CreateDriverTransaction = {
  action?: InputMaybe<TransactionAction>;
  amount?: InputMaybe<Scalars['Float']>;
  createdAt?: InputMaybe<Scalars['DateTime']>;
  currency?: InputMaybe<Scalars['String']>;
  deductType?: InputMaybe<DriverDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  driverId?: InputMaybe<Scalars['ID']>;
  operatorId?: InputMaybe<Scalars['ID']>;
  paymentGatewayId?: InputMaybe<Scalars['Float']>;
  rechargeType?: InputMaybe<DriverRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
  requestId?: InputMaybe<Scalars['Float']>;
  status?: InputMaybe<TransactionStatus>;
};

export type CreateFeedbackParameter = {
  id?: InputMaybe<Scalars['ID']>;
  isGood?: InputMaybe<Scalars['Boolean']>;
  title?: InputMaybe<Scalars['String']>;
};

export type CreateFleet = {
  accountNumber?: InputMaybe<Scalars['String']>;
  address?: InputMaybe<Scalars['String']>;
  commissionShareFlat?: InputMaybe<Scalars['Float']>;
  commissionSharePercent?: InputMaybe<Scalars['Float']>;
  exclusivityAreas?: InputMaybe<Array<Array<PointInput>>>;
  feeMultiplier?: InputMaybe<Scalars['Float']>;
  id?: InputMaybe<Scalars['ID']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  name?: InputMaybe<Scalars['String']>;
  phoneNumber?: InputMaybe<Scalars['String']>;
};

export type CreateManyComplaintActivitiesInput = {
  /** Array of records to create */
  complaintActivities: Array<CreateComplaintActivity>;
};

export type CreateOneAnnouncementInput = {
  /** The record to create */
  announcement: CreateAnnouncement;
};

export type CreateOneCarColorInput = {
  /** The record to create */
  carColor: CreateCarColor;
};

export type CreateOneCarModelInput = {
  /** The record to create */
  carModel: CreateCarModel;
};

export type CreateOneComplaintActivityInput = {
  /** The record to create */
  complaintActivity: CreateComplaintActivity;
};

export type CreateOneCouponInput = {
  /** The record to create */
  coupon: CreateCoupon;
};

export type CreateOneDriverInput = {
  /** The record to create */
  driver: CreateDriver;
};

export type CreateOneDriverTransactionInput = {
  /** The record to create */
  driverTransaction: CreateDriverTransaction;
};

export type CreateOneFeedbackParameterInput = {
  /** The record to create */
  feedbackParameter: CreateFeedbackParameter;
};

export type CreateOneFleetInput = {
  /** The record to create */
  fleet: CreateFleet;
};

export type CreateOneOperatorInput = {
  /** The record to create */
  operator: CreateOperatorInput;
};

export type CreateOneOperatorRoleInput = {
  /** The record to create */
  operatorRole: CreateOperatorRole;
};

export type CreateOnePaymentGatewayInput = {
  /** The record to create */
  paymentGateway: CreatePaymentGateway;
};

export type CreateOneProviderTransactionInput = {
  /** The record to create */
  providerTransaction: CreateProviderTransaction;
};

export type CreateOneRegionInput = {
  /** The record to create */
  region: CreateRegion;
};

export type CreateOneRewardInput = {
  /** The record to create */
  reward: CreateReward;
};

export type CreateOneRiderAddressInput = {
  /** The record to create */
  riderAddress: CreateRiderAddress;
};

export type CreateOneRiderInput = {
  /** The record to create */
  rider: CreateRider;
};

export type CreateOneRiderTransactionInput = {
  /** The record to create */
  riderTransaction: CreateRiderTransaction;
};

export type CreateOneSosActivityInput = {
  /** The record to create */
  sOSActivity: CreateSosAcitivtyInput;
};

export type CreateOneServiceCategoryInput = {
  /** The record to create */
  serviceCategory: CreateServiceCategory;
};

export type CreateOneServiceInput = {
  /** The record to create */
  service: CreateService;
};

export type CreateOneServiceOptionInput = {
  /** The record to create */
  serviceOption: CreateServiceOption;
};

export type CreateOneZonePriceInput = {
  /** The record to create */
  zonePrice: CreateZonePrice;
};

export type CreateOperatorInput = {
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  lastName?: InputMaybe<Scalars['String']>;
  mobileNumber: Scalars['String'];
  password: Scalars['String'];
  roleId: Scalars['ID'];
  userName: Scalars['String'];
};

export type CreateOperatorRole = {
  id?: InputMaybe<Scalars['ID']>;
  permissions?: InputMaybe<Array<OperatorPermission>>;
  title?: InputMaybe<Scalars['String']>;
};

export type CreateOrderInput = {
  addresses: Array<Scalars['String']>;
  intervalMinutes: Scalars['Int'];
  points: Array<PointInput>;
  riderId: Scalars['ID'];
  serviceId: Scalars['ID'];
};

export type CreatePaymentGateway = {
  enabled?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['ID']>;
  mediaId?: InputMaybe<Scalars['Float']>;
  merchantId?: InputMaybe<Scalars['String']>;
  privateKey?: InputMaybe<Scalars['String']>;
  publicKey?: InputMaybe<Scalars['String']>;
  saltKey?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<PaymentGatewayType>;
};

export type CreateProviderTransaction = {
  action?: InputMaybe<TransactionAction>;
  amount?: InputMaybe<Scalars['Float']>;
  createdAt?: InputMaybe<Scalars['DateTime']>;
  currency?: InputMaybe<Scalars['String']>;
  deductType?: InputMaybe<ProviderDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  operatorId?: InputMaybe<Scalars['ID']>;
  rechargeType?: InputMaybe<ProviderRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
  requestId?: InputMaybe<Scalars['ID']>;
};

export type CreateRegion = {
  currency?: InputMaybe<Scalars['String']>;
  enabled?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['ID']>;
  location?: InputMaybe<Array<Array<PointInput>>>;
  name?: InputMaybe<Scalars['String']>;
};

export type CreateReward = {
  appType?: InputMaybe<RewardAppType>;
  beneficiary?: InputMaybe<RewardBeneficiary>;
  conditionTripCountsLessThan?: InputMaybe<Scalars['Float']>;
  conditionUserNumberFirstDigits?: InputMaybe<Array<Scalars['String']>>;
  creditCurrency?: InputMaybe<Scalars['String']>;
  creditGift?: InputMaybe<Scalars['Float']>;
  endDate?: InputMaybe<Scalars['DateTime']>;
  event?: InputMaybe<RewardEvent>;
  id?: InputMaybe<Scalars['ID']>;
  startDate?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
  tripFeePercentGift?: InputMaybe<Scalars['Float']>;
};

export type CreateRider = {
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  gender?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  idNumber?: InputMaybe<Scalars['String']>;
  isResident?: InputMaybe<Scalars['Boolean']>;
  lastName?: InputMaybe<Scalars['String']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  registrationTimestamp?: InputMaybe<Scalars['DateTime']>;
  status?: InputMaybe<RiderStatus>;
};

export type CreateRiderAddress = {
  details?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  location?: InputMaybe<PointInput>;
  riderId?: InputMaybe<Scalars['ID']>;
  title?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<RiderAddressType>;
};

export type CreateRiderTransaction = {
  action?: InputMaybe<TransactionAction>;
  amount?: InputMaybe<Scalars['Float']>;
  createdAt?: InputMaybe<Scalars['DateTime']>;
  currency?: InputMaybe<Scalars['String']>;
  deductType?: InputMaybe<RiderDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  operatorId?: InputMaybe<Scalars['ID']>;
  paymentGatewayId?: InputMaybe<Scalars['ID']>;
  rechargeType?: InputMaybe<RiderRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
  requestId?: InputMaybe<Scalars['ID']>;
  riderId?: InputMaybe<Scalars['ID']>;
  status?: InputMaybe<TransactionStatus>;
};

export type CreateSosAcitivtyInput = {
  action: SosActivityAction;
  note?: InputMaybe<Scalars['String']>;
  sosId: Scalars['ID'];
};

export type CreateService = {
  baseFare?: InputMaybe<Scalars['Float']>;
  cancellationDriverShare?: InputMaybe<Scalars['Float']>;
  cancellationTotalFee?: InputMaybe<Scalars['Float']>;
  categoryId?: InputMaybe<Scalars['ID']>;
  description?: InputMaybe<Scalars['String']>;
  distanceMultipliers?: InputMaybe<Array<DistanceMultiplierInput>>;
  id?: InputMaybe<Scalars['ID']>;
  maximumDestinationDistance?: InputMaybe<Scalars['Int']>;
  mediaId?: InputMaybe<Scalars['ID']>;
  minimumFee?: InputMaybe<Scalars['Float']>;
  name?: InputMaybe<Scalars['String']>;
  paymentMethod?: InputMaybe<ServicePaymentMethod>;
  perHundredMeters?: InputMaybe<Scalars['Float']>;
  perMinuteDrive?: InputMaybe<Scalars['Float']>;
  perMinuteWait?: InputMaybe<Scalars['Float']>;
  personCapacity?: InputMaybe<Scalars['Int']>;
  prepayPercent?: InputMaybe<Scalars['Float']>;
  providerShareFlat?: InputMaybe<Scalars['Float']>;
  providerSharePercent?: InputMaybe<Scalars['Int']>;
  roundingFactor?: InputMaybe<Scalars['Float']>;
  searchRadius?: InputMaybe<Scalars['Int']>;
  timeMultipliers?: InputMaybe<Array<TimeMultiplierInput>>;
  twoWayAvailable?: InputMaybe<Scalars['Boolean']>;
};

export type CreateServiceCategory = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type CreateServiceOption = {
  additionalFee?: InputMaybe<Scalars['Float']>;
  icon?: InputMaybe<ServiceOptionIcon>;
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<ServiceOptionType>;
};

export type CreateZonePrice = {
  cost?: InputMaybe<Scalars['Float']>;
  from?: InputMaybe<Array<Array<PointInput>>>;
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
  timeMultipliers?: InputMaybe<Array<TimeMultiplierInput>>;
  to?: InputMaybe<Array<Array<PointInput>>>;
};

export type CurrentConfiguration = {
  __typename?: 'CurrentConfiguration';
  adminPanelAPIKey?: Maybe<Scalars['String']>;
  backendMapsAPIKey?: Maybe<Scalars['String']>;
  firebaseProjectPrivateKey?: Maybe<Scalars['String']>;
  purchaseCode?: Maybe<Scalars['String']>;
};

export type CursorPaging = {
  /** Paginate after opaque cursor */
  after?: InputMaybe<Scalars['ConnectionCursor']>;
  /** Paginate before opaque cursor */
  before?: InputMaybe<Scalars['ConnectionCursor']>;
  /** Paginate first */
  first?: InputMaybe<Scalars['Int']>;
  /** Paginate last */
  last?: InputMaybe<Scalars['Int']>;
};

export type DateFieldComparison = {
  between?: InputMaybe<DateFieldComparisonBetween>;
  eq?: InputMaybe<Scalars['DateTime']>;
  gt?: InputMaybe<Scalars['DateTime']>;
  gte?: InputMaybe<Scalars['DateTime']>;
  in?: InputMaybe<Array<Scalars['DateTime']>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  lt?: InputMaybe<Scalars['DateTime']>;
  lte?: InputMaybe<Scalars['DateTime']>;
  neq?: InputMaybe<Scalars['DateTime']>;
  notBetween?: InputMaybe<DateFieldComparisonBetween>;
  notIn?: InputMaybe<Array<Scalars['DateTime']>>;
};

export type DateFieldComparisonBetween = {
  lower: Scalars['DateTime'];
  upper: Scalars['DateTime'];
};

export type DeleteOneAnnouncementInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneCarColorInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneCarModelInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneFeedbackParameterInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneRegionInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneRewardInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneServiceCategoryInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneServiceInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneServiceOptionInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DeleteOneZonePriceInput = {
  /** The id of the record to delete. */
  id: Scalars['ID'];
};

export type DistanceMultiplier = {
  __typename?: 'DistanceMultiplier';
  distanceFrom: Scalars['Float'];
  distanceTo: Scalars['Float'];
  multiply: Scalars['Float'];
};

export type DistanceMultiplierInput = {
  distanceFrom: Scalars['Float'];
  distanceTo: Scalars['Float'];
  multiply: Scalars['Float'];
};

export type DistressSignal = {
  __typename?: 'DistressSignal';
  activities: Array<SosActivity>;
  createdAt: Scalars['DateTime'];
  id: Scalars['ID'];
  location?: Maybe<Point>;
  order: Order;
  requestId: Scalars['Float'];
  status: SosStatus;
  submittedByRider: Scalars['Boolean'];
};


export type DistressSignalActivitiesArgs = {
  filter?: InputMaybe<SosActivityFilter>;
  sorting?: InputMaybe<Array<SosActivitySort>>;
};

export type DistressSignalAggregateGroupBy = {
  __typename?: 'DistressSignalAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type DistressSignalAvgAggregate = {
  __typename?: 'DistressSignalAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type DistressSignalConnection = {
  __typename?: 'DistressSignalConnection';
  /** Array of nodes. */
  nodes: Array<DistressSignal>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DistressSignalCountAggregate = {
  __typename?: 'DistressSignalCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type DistressSignalFilter = {
  and?: InputMaybe<Array<DistressSignalFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<DistressSignalFilter>>;
};

export type DistressSignalMaxAggregate = {
  __typename?: 'DistressSignalMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type DistressSignalMinAggregate = {
  __typename?: 'DistressSignalMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type DistressSignalSort = {
  direction: SortDirection;
  field: DistressSignalSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum DistressSignalSortFields {
  Id = 'id'
}

export type DistressSignalSumAggregate = {
  __typename?: 'DistressSignalSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type Driver = {
  __typename?: 'Driver';
  accountNumber?: Maybe<Scalars['String']>;
  address?: Maybe<Scalars['String']>;
  bankName?: Maybe<Scalars['String']>;
  bankRoutingNumber?: Maybe<Scalars['String']>;
  bankSwift?: Maybe<Scalars['String']>;
  carColorId?: Maybe<Scalars['ID']>;
  carId?: Maybe<Scalars['ID']>;
  carPlate?: Maybe<Scalars['String']>;
  carProductionYear?: Maybe<Scalars['Int']>;
  certificateNumber?: Maybe<Scalars['String']>;
  documents: Array<Media>;
  documentsAggregate: Array<DriverDocumentsAggregateResponse>;
  email?: Maybe<Scalars['String']>;
  enabledServices: Array<Service>;
  enabledServicesAggregate: Array<DriverEnabledServicesAggregateResponse>;
  feedbacks: DriverFeedbacksConnection;
  feedbacksAggregate: Array<DriverFeedbacksAggregateResponse>;
  firstName?: Maybe<Scalars['String']>;
  fleetId?: Maybe<Scalars['ID']>;
  gender?: Maybe<Gender>;
  id: Scalars['ID'];
  lastName?: Maybe<Scalars['String']>;
  lastSeenTimestamp?: Maybe<Scalars['DateTime']>;
  media?: Maybe<Media>;
  mediaId?: Maybe<Scalars['ID']>;
  mobileNumber: Scalars['String'];
  orders: DriverOrdersConnection;
  ordersAggregate: Array<DriverOrdersAggregateResponse>;
  rating?: Maybe<Scalars['Float']>;
  registrationTimestamp: Scalars['DateTime'];
  reviewCount: Scalars['Float'];
  softRejectionNote?: Maybe<Scalars['String']>;
  status: DriverStatus;
  transactions: DriverTransactionsConnection;
  transactionsAggregate: Array<DriverTransactionsAggregateResponse>;
  wallets: Array<DriverWallet>;
  walletsAggregate: Array<DriverWalletsAggregateResponse>;
};


export type DriverDocumentsArgs = {
  filter?: InputMaybe<MediaFilter>;
  sorting?: InputMaybe<Array<MediaSort>>;
};


export type DriverDocumentsAggregateArgs = {
  filter?: InputMaybe<MediaAggregateFilter>;
};


export type DriverEnabledServicesArgs = {
  filter?: InputMaybe<ServiceFilter>;
  sorting?: InputMaybe<Array<ServiceSort>>;
};


export type DriverEnabledServicesAggregateArgs = {
  filter?: InputMaybe<ServiceAggregateFilter>;
};


export type DriverFeedbacksArgs = {
  filter?: InputMaybe<FeedbackFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FeedbackSort>>;
};


export type DriverFeedbacksAggregateArgs = {
  filter?: InputMaybe<FeedbackAggregateFilter>;
};


export type DriverOrdersArgs = {
  filter?: InputMaybe<OrderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OrderSort>>;
};


export type DriverOrdersAggregateArgs = {
  filter?: InputMaybe<OrderAggregateFilter>;
};


export type DriverTransactionsArgs = {
  filter?: InputMaybe<DriverTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<DriverTransactionSort>>;
};


export type DriverTransactionsAggregateArgs = {
  filter?: InputMaybe<DriverTransactionAggregateFilter>;
};


export type DriverWalletsArgs = {
  filter?: InputMaybe<DriverWalletFilter>;
  sorting?: InputMaybe<Array<DriverWalletSort>>;
};


export type DriverWalletsAggregateArgs = {
  filter?: InputMaybe<DriverWalletAggregateFilter>;
};

export type DriverAggregateFilter = {
  and?: InputMaybe<Array<DriverAggregateFilter>>;
  fleetId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  lastName?: InputMaybe<StringFieldComparison>;
  mobileNumber?: InputMaybe<StringFieldComparison>;
  or?: InputMaybe<Array<DriverAggregateFilter>>;
  status?: InputMaybe<DriverStatusFilterComparison>;
};

export type DriverAggregateGroupBy = {
  __typename?: 'DriverAggregateGroupBy';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
  status?: Maybe<DriverStatus>;
};

export type DriverAggregateResponse = {
  __typename?: 'DriverAggregateResponse';
  avg?: Maybe<DriverAvgAggregate>;
  count?: Maybe<DriverCountAggregate>;
  groupBy?: Maybe<DriverAggregateGroupBy>;
  max?: Maybe<DriverMaxAggregate>;
  min?: Maybe<DriverMinAggregate>;
  sum?: Maybe<DriverSumAggregate>;
};

export type DriverAvgAggregate = {
  __typename?: 'DriverAvgAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverConnection = {
  __typename?: 'DriverConnection';
  /** Array of nodes. */
  nodes: Array<Driver>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverCountAggregate = {
  __typename?: 'DriverCountAggregate';
  fleetId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  lastName?: Maybe<Scalars['Int']>;
  mobileNumber?: Maybe<Scalars['Int']>;
  status?: Maybe<Scalars['Int']>;
};

export enum DriverDeductTransactionType {
  Commission = 'Commission',
  Correction = 'Correction',
  Withdraw = 'Withdraw'
}

export type DriverDocumentsAggregateGroupBy = {
  __typename?: 'DriverDocumentsAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type DriverDocumentsAggregateResponse = {
  __typename?: 'DriverDocumentsAggregateResponse';
  avg?: Maybe<DriverDocumentsAvgAggregate>;
  count?: Maybe<DriverDocumentsCountAggregate>;
  groupBy?: Maybe<DriverDocumentsAggregateGroupBy>;
  max?: Maybe<DriverDocumentsMaxAggregate>;
  min?: Maybe<DriverDocumentsMinAggregate>;
  sum?: Maybe<DriverDocumentsSumAggregate>;
};

export type DriverDocumentsAvgAggregate = {
  __typename?: 'DriverDocumentsAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type DriverDocumentsCountAggregate = {
  __typename?: 'DriverDocumentsCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type DriverDocumentsMaxAggregate = {
  __typename?: 'DriverDocumentsMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type DriverDocumentsMinAggregate = {
  __typename?: 'DriverDocumentsMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type DriverDocumentsSumAggregate = {
  __typename?: 'DriverDocumentsSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type DriverEnabledServicesAggregateGroupBy = {
  __typename?: 'DriverEnabledServicesAggregateGroupBy';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverEnabledServicesAggregateResponse = {
  __typename?: 'DriverEnabledServicesAggregateResponse';
  avg?: Maybe<DriverEnabledServicesAvgAggregate>;
  count?: Maybe<DriverEnabledServicesCountAggregate>;
  groupBy?: Maybe<DriverEnabledServicesAggregateGroupBy>;
  max?: Maybe<DriverEnabledServicesMaxAggregate>;
  min?: Maybe<DriverEnabledServicesMinAggregate>;
  sum?: Maybe<DriverEnabledServicesSumAggregate>;
};

export type DriverEnabledServicesAvgAggregate = {
  __typename?: 'DriverEnabledServicesAvgAggregate';
  categoryId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverEnabledServicesCountAggregate = {
  __typename?: 'DriverEnabledServicesCountAggregate';
  categoryId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type DriverEnabledServicesMaxAggregate = {
  __typename?: 'DriverEnabledServicesMaxAggregate';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverEnabledServicesMinAggregate = {
  __typename?: 'DriverEnabledServicesMinAggregate';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverEnabledServicesSumAggregate = {
  __typename?: 'DriverEnabledServicesSumAggregate';
  categoryId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverFeedbacksAggregateGroupBy = {
  __typename?: 'DriverFeedbacksAggregateGroupBy';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type DriverFeedbacksAggregateResponse = {
  __typename?: 'DriverFeedbacksAggregateResponse';
  avg?: Maybe<DriverFeedbacksAvgAggregate>;
  count?: Maybe<DriverFeedbacksCountAggregate>;
  groupBy?: Maybe<DriverFeedbacksAggregateGroupBy>;
  max?: Maybe<DriverFeedbacksMaxAggregate>;
  min?: Maybe<DriverFeedbacksMinAggregate>;
  sum?: Maybe<DriverFeedbacksSumAggregate>;
};

export type DriverFeedbacksAvgAggregate = {
  __typename?: 'DriverFeedbacksAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type DriverFeedbacksConnection = {
  __typename?: 'DriverFeedbacksConnection';
  /** Array of nodes. */
  nodes: Array<Feedback>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverFeedbacksCountAggregate = {
  __typename?: 'DriverFeedbacksCountAggregate';
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type DriverFeedbacksMaxAggregate = {
  __typename?: 'DriverFeedbacksMaxAggregate';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type DriverFeedbacksMinAggregate = {
  __typename?: 'DriverFeedbacksMinAggregate';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type DriverFeedbacksSumAggregate = {
  __typename?: 'DriverFeedbacksSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type DriverFilter = {
  and?: InputMaybe<Array<DriverFilter>>;
  fleetId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  lastName?: InputMaybe<StringFieldComparison>;
  mobileNumber?: InputMaybe<StringFieldComparison>;
  or?: InputMaybe<Array<DriverFilter>>;
  status?: InputMaybe<DriverStatusFilterComparison>;
};

export type DriverMaxAggregate = {
  __typename?: 'DriverMaxAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
  status?: Maybe<DriverStatus>;
};

export type DriverMinAggregate = {
  __typename?: 'DriverMinAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
  status?: Maybe<DriverStatus>;
};

export type DriverOrdersAggregateGroupBy = {
  __typename?: 'DriverOrdersAggregateGroupBy';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type DriverOrdersAggregateResponse = {
  __typename?: 'DriverOrdersAggregateResponse';
  avg?: Maybe<DriverOrdersAvgAggregate>;
  count?: Maybe<DriverOrdersCountAggregate>;
  groupBy?: Maybe<DriverOrdersAggregateGroupBy>;
  max?: Maybe<DriverOrdersMaxAggregate>;
  min?: Maybe<DriverOrdersMinAggregate>;
  sum?: Maybe<DriverOrdersSumAggregate>;
};

export type DriverOrdersAvgAggregate = {
  __typename?: 'DriverOrdersAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type DriverOrdersConnection = {
  __typename?: 'DriverOrdersConnection';
  /** Array of nodes. */
  nodes: Array<Order>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverOrdersCountAggregate = {
  __typename?: 'DriverOrdersCountAggregate';
  createdOn?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
  status?: Maybe<Scalars['Int']>;
};

export type DriverOrdersMaxAggregate = {
  __typename?: 'DriverOrdersMaxAggregate';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type DriverOrdersMinAggregate = {
  __typename?: 'DriverOrdersMinAggregate';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type DriverOrdersSumAggregate = {
  __typename?: 'DriverOrdersSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export enum DriverRechargeTransactionType {
  BankTransfer = 'BankTransfer',
  Gift = 'Gift',
  InAppPayment = 'InAppPayment',
  OrderFee = 'OrderFee'
}

export type DriverSort = {
  direction: SortDirection;
  field: DriverSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum DriverSortFields {
  FleetId = 'fleetId',
  Id = 'id',
  LastName = 'lastName',
  MobileNumber = 'mobileNumber',
  Status = 'status'
}

export enum DriverStatus {
  Blocked = 'Blocked',
  HardReject = 'HardReject',
  InService = 'InService',
  Offline = 'Offline',
  Online = 'Online',
  PendingApproval = 'PendingApproval',
  SoftReject = 'SoftReject',
  WaitingDocuments = 'WaitingDocuments'
}

export type DriverStatusFilterComparison = {
  eq?: InputMaybe<DriverStatus>;
  gt?: InputMaybe<DriverStatus>;
  gte?: InputMaybe<DriverStatus>;
  iLike?: InputMaybe<DriverStatus>;
  in?: InputMaybe<Array<DriverStatus>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  like?: InputMaybe<DriverStatus>;
  lt?: InputMaybe<DriverStatus>;
  lte?: InputMaybe<DriverStatus>;
  neq?: InputMaybe<DriverStatus>;
  notILike?: InputMaybe<DriverStatus>;
  notIn?: InputMaybe<Array<DriverStatus>>;
  notLike?: InputMaybe<DriverStatus>;
};

export type DriverSumAggregate = {
  __typename?: 'DriverSumAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverTransaction = {
  __typename?: 'DriverTransaction';
  action: TransactionAction;
  amount: Scalars['Float'];
  createdAt: Scalars['DateTime'];
  currency: Scalars['String'];
  deductType?: Maybe<DriverDeductTransactionType>;
  description?: Maybe<Scalars['String']>;
  driverId: Scalars['ID'];
  operator?: Maybe<Operator>;
  operatorId?: Maybe<Scalars['ID']>;
  paymentGatewayId?: Maybe<Scalars['Float']>;
  rechargeType?: Maybe<DriverRechargeTransactionType>;
  refrenceNumber?: Maybe<Scalars['String']>;
  requestId?: Maybe<Scalars['Float']>;
  status: TransactionStatus;
};

export type DriverTransactionAggregateFilter = {
  and?: InputMaybe<Array<DriverTransactionAggregateFilter>>;
  createdAt?: InputMaybe<DateFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<DriverTransactionAggregateFilter>>;
};

export type DriverTransactionAggregateGroupBy = {
  __typename?: 'DriverTransactionAggregateGroupBy';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionAvgAggregate = {
  __typename?: 'DriverTransactionAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type DriverTransactionConnection = {
  __typename?: 'DriverTransactionConnection';
  /** Array of nodes. */
  nodes: Array<DriverTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverTransactionCountAggregate = {
  __typename?: 'DriverTransactionCountAggregate';
  createdAt?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
};

export type DriverTransactionFilter = {
  and?: InputMaybe<Array<DriverTransactionFilter>>;
  createdAt?: InputMaybe<DateFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<DriverTransactionFilter>>;
};

export type DriverTransactionInput = {
  action: TransactionAction;
  amount: Scalars['Float'];
  currency: Scalars['String'];
  deductType?: InputMaybe<DriverDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  driverId: Scalars['ID'];
  rechargeType?: InputMaybe<DriverRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
};

export type DriverTransactionMaxAggregate = {
  __typename?: 'DriverTransactionMaxAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionMinAggregate = {
  __typename?: 'DriverTransactionMinAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionSort = {
  direction: SortDirection;
  field: DriverTransactionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum DriverTransactionSortFields {
  CreatedAt = 'createdAt',
  DriverId = 'driverId'
}

export type DriverTransactionSumAggregate = {
  __typename?: 'DriverTransactionSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type DriverTransactionsAggregateGroupBy = {
  __typename?: 'DriverTransactionsAggregateGroupBy';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionsAggregateResponse = {
  __typename?: 'DriverTransactionsAggregateResponse';
  avg?: Maybe<DriverTransactionsAvgAggregate>;
  count?: Maybe<DriverTransactionsCountAggregate>;
  groupBy?: Maybe<DriverTransactionsAggregateGroupBy>;
  max?: Maybe<DriverTransactionsMaxAggregate>;
  min?: Maybe<DriverTransactionsMinAggregate>;
  sum?: Maybe<DriverTransactionsSumAggregate>;
};

export type DriverTransactionsAvgAggregate = {
  __typename?: 'DriverTransactionsAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type DriverTransactionsConnection = {
  __typename?: 'DriverTransactionsConnection';
  /** Array of nodes. */
  nodes: Array<DriverTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverTransactionsCountAggregate = {
  __typename?: 'DriverTransactionsCountAggregate';
  createdAt?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
};

export type DriverTransactionsMaxAggregate = {
  __typename?: 'DriverTransactionsMaxAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionsMinAggregate = {
  __typename?: 'DriverTransactionsMinAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type DriverTransactionsSumAggregate = {
  __typename?: 'DriverTransactionsSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type DriverWallet = {
  __typename?: 'DriverWallet';
  balance: Scalars['Float'];
  currency: Scalars['String'];
  driver?: Maybe<Driver>;
  driverId?: Maybe<Scalars['ID']>;
  id: Scalars['ID'];
};

export type DriverWalletAggregateFilter = {
  and?: InputMaybe<Array<DriverWalletAggregateFilter>>;
  balance?: InputMaybe<FloatFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<DriverWalletAggregateFilter>>;
};

export type DriverWalletAggregateGroupBy = {
  __typename?: 'DriverWalletAggregateGroupBy';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletAvgAggregate = {
  __typename?: 'DriverWalletAvgAggregate';
  balance?: Maybe<Scalars['Float']>;
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverWalletConnection = {
  __typename?: 'DriverWalletConnection';
  /** Array of nodes. */
  nodes: Array<DriverWallet>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type DriverWalletCountAggregate = {
  __typename?: 'DriverWalletCountAggregate';
  balance?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type DriverWalletFilter = {
  and?: InputMaybe<Array<DriverWalletFilter>>;
  balance?: InputMaybe<FloatFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<DriverWalletFilter>>;
};

export type DriverWalletMaxAggregate = {
  __typename?: 'DriverWalletMaxAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletMinAggregate = {
  __typename?: 'DriverWalletMinAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletSort = {
  direction: SortDirection;
  field: DriverWalletSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum DriverWalletSortFields {
  Balance = 'balance',
  Currency = 'currency',
  DriverId = 'driverId',
  Id = 'id'
}

export type DriverWalletSumAggregate = {
  __typename?: 'DriverWalletSumAggregate';
  balance?: Maybe<Scalars['Float']>;
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverWalletsAggregateGroupBy = {
  __typename?: 'DriverWalletsAggregateGroupBy';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletsAggregateResponse = {
  __typename?: 'DriverWalletsAggregateResponse';
  avg?: Maybe<DriverWalletsAvgAggregate>;
  count?: Maybe<DriverWalletsCountAggregate>;
  groupBy?: Maybe<DriverWalletsAggregateGroupBy>;
  max?: Maybe<DriverWalletsMaxAggregate>;
  min?: Maybe<DriverWalletsMinAggregate>;
  sum?: Maybe<DriverWalletsSumAggregate>;
};

export type DriverWalletsAvgAggregate = {
  __typename?: 'DriverWalletsAvgAggregate';
  balance?: Maybe<Scalars['Float']>;
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type DriverWalletsCountAggregate = {
  __typename?: 'DriverWalletsCountAggregate';
  balance?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type DriverWalletsMaxAggregate = {
  __typename?: 'DriverWalletsMaxAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletsMinAggregate = {
  __typename?: 'DriverWalletsMinAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type DriverWalletsSumAggregate = {
  __typename?: 'DriverWalletsSumAggregate';
  balance?: Maybe<Scalars['Float']>;
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ExportArgs = {
  filters?: InputMaybe<Array<ExportFilterArg>>;
  relations?: InputMaybe<Array<Scalars['String']>>;
  sort?: InputMaybe<ExportSortArg>;
  table: ExportTable;
  type: ExportType;
};

export type ExportFilterArg = {
  field: Scalars['String'];
  value: Scalars['String'];
};

export type ExportResult = {
  __typename?: 'ExportResult';
  url: Scalars['String'];
};

export type ExportSortArg = {
  direction: SortDirection;
  property: Scalars['String'];
};

export enum ExportTable {
  DriverWallet = 'DriverWallet',
  FleetWallet = 'FleetWallet',
  ProviderWallet = 'ProviderWallet',
  RiderWallet = 'RiderWallet'
}

export enum ExportType {
  Csv = 'CSV'
}

export type Feedback = {
  __typename?: 'Feedback';
  description?: Maybe<Scalars['String']>;
  driverId: Scalars['ID'];
  id: Scalars['ID'];
  parameters: Array<FeedbackParameter>;
  parametersAggregate: Array<FeedbackParametersAggregateResponse>;
  requestId: Scalars['ID'];
  reviewTimestamp: Scalars['DateTime'];
  score: Scalars['Int'];
};


export type FeedbackParametersArgs = {
  filter?: InputMaybe<FeedbackParameterFilter>;
  sorting?: InputMaybe<Array<FeedbackParameterSort>>;
};


export type FeedbackParametersAggregateArgs = {
  filter?: InputMaybe<FeedbackParameterAggregateFilter>;
};

export type FeedbackAggregateFilter = {
  and?: InputMaybe<Array<FeedbackAggregateFilter>>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<FeedbackAggregateFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type FeedbackAggregateGroupBy = {
  __typename?: 'FeedbackAggregateGroupBy';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FeedbackAvgAggregate = {
  __typename?: 'FeedbackAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type FeedbackConnection = {
  __typename?: 'FeedbackConnection';
  /** Array of nodes. */
  nodes: Array<Feedback>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FeedbackCountAggregate = {
  __typename?: 'FeedbackCountAggregate';
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type FeedbackFilter = {
  and?: InputMaybe<Array<FeedbackFilter>>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<FeedbackFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type FeedbackMaxAggregate = {
  __typename?: 'FeedbackMaxAggregate';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FeedbackMinAggregate = {
  __typename?: 'FeedbackMinAggregate';
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FeedbackParameter = {
  __typename?: 'FeedbackParameter';
  id: Scalars['ID'];
  isGood: Scalars['Boolean'];
  title: Scalars['String'];
};

export type FeedbackParameterAggregateFilter = {
  and?: InputMaybe<Array<FeedbackParameterAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  isGood?: InputMaybe<BooleanFieldComparison>;
  or?: InputMaybe<Array<FeedbackParameterAggregateFilter>>;
  title?: InputMaybe<StringFieldComparison>;
};

export type FeedbackParameterAggregateGroupBy = {
  __typename?: 'FeedbackParameterAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  isGood?: Maybe<Scalars['Boolean']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParameterAvgAggregate = {
  __typename?: 'FeedbackParameterAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FeedbackParameterCountAggregate = {
  __typename?: 'FeedbackParameterCountAggregate';
  id?: Maybe<Scalars['Int']>;
  isGood?: Maybe<Scalars['Int']>;
  title?: Maybe<Scalars['Int']>;
};

export type FeedbackParameterDeleteResponse = {
  __typename?: 'FeedbackParameterDeleteResponse';
  id?: Maybe<Scalars['ID']>;
  isGood?: Maybe<Scalars['Boolean']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParameterFilter = {
  and?: InputMaybe<Array<FeedbackParameterFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  isGood?: InputMaybe<BooleanFieldComparison>;
  or?: InputMaybe<Array<FeedbackParameterFilter>>;
  title?: InputMaybe<StringFieldComparison>;
};

export type FeedbackParameterMaxAggregate = {
  __typename?: 'FeedbackParameterMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParameterMinAggregate = {
  __typename?: 'FeedbackParameterMinAggregate';
  id?: Maybe<Scalars['ID']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParameterSort = {
  direction: SortDirection;
  field: FeedbackParameterSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum FeedbackParameterSortFields {
  Id = 'id',
  IsGood = 'isGood',
  Title = 'title'
}

export type FeedbackParameterSumAggregate = {
  __typename?: 'FeedbackParameterSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FeedbackParametersAggregateGroupBy = {
  __typename?: 'FeedbackParametersAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  isGood?: Maybe<Scalars['Boolean']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParametersAggregateResponse = {
  __typename?: 'FeedbackParametersAggregateResponse';
  avg?: Maybe<FeedbackParametersAvgAggregate>;
  count?: Maybe<FeedbackParametersCountAggregate>;
  groupBy?: Maybe<FeedbackParametersAggregateGroupBy>;
  max?: Maybe<FeedbackParametersMaxAggregate>;
  min?: Maybe<FeedbackParametersMinAggregate>;
  sum?: Maybe<FeedbackParametersSumAggregate>;
};

export type FeedbackParametersAvgAggregate = {
  __typename?: 'FeedbackParametersAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FeedbackParametersCountAggregate = {
  __typename?: 'FeedbackParametersCountAggregate';
  id?: Maybe<Scalars['Int']>;
  isGood?: Maybe<Scalars['Int']>;
  title?: Maybe<Scalars['Int']>;
};

export type FeedbackParametersMaxAggregate = {
  __typename?: 'FeedbackParametersMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParametersMinAggregate = {
  __typename?: 'FeedbackParametersMinAggregate';
  id?: Maybe<Scalars['ID']>;
  title?: Maybe<Scalars['String']>;
};

export type FeedbackParametersSumAggregate = {
  __typename?: 'FeedbackParametersSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FeedbackSort = {
  direction: SortDirection;
  field: FeedbackSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum FeedbackSortFields {
  DriverId = 'driverId',
  Id = 'id',
  RequestId = 'requestId'
}

export type FeedbackSumAggregate = {
  __typename?: 'FeedbackSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type Fleet = {
  __typename?: 'Fleet';
  accountNumber: Scalars['String'];
  address?: Maybe<Scalars['String']>;
  commissionShareFlat: Scalars['Float'];
  commissionSharePercent: Scalars['Float'];
  exclusivityAreas?: Maybe<Array<Array<Point>>>;
  feeMultiplier?: Maybe<Scalars['Float']>;
  id: Scalars['ID'];
  mobileNumber: Scalars['String'];
  name: Scalars['String'];
  phoneNumber: Scalars['String'];
  transactions: FleetTransactionsConnection;
  wallets: Array<FleetWallet>;
  zonePrices: FleetZonePricesConnection;
};


export type FleetTransactionsArgs = {
  filter?: InputMaybe<FleetTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FleetTransactionSort>>;
};


export type FleetWalletsArgs = {
  filter?: InputMaybe<FleetWalletFilter>;
  sorting?: InputMaybe<Array<FleetWalletSort>>;
};


export type FleetZonePricesArgs = {
  filter?: InputMaybe<ZonePriceFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<ZonePriceSort>>;
};

export type FleetAggregateGroupBy = {
  __typename?: 'FleetAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type FleetAvgAggregate = {
  __typename?: 'FleetAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FleetConnection = {
  __typename?: 'FleetConnection';
  /** Array of nodes. */
  nodes: Array<Fleet>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FleetCountAggregate = {
  __typename?: 'FleetCountAggregate';
  id?: Maybe<Scalars['Int']>;
  name?: Maybe<Scalars['Int']>;
};

export type FleetFilter = {
  and?: InputMaybe<Array<FleetFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  name?: InputMaybe<StringFieldComparison>;
  or?: InputMaybe<Array<FleetFilter>>;
};

export type FleetMaxAggregate = {
  __typename?: 'FleetMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type FleetMinAggregate = {
  __typename?: 'FleetMinAggregate';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type FleetSort = {
  direction: SortDirection;
  field: FleetSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum FleetSortFields {
  Id = 'id',
  Name = 'name'
}

export type FleetSumAggregate = {
  __typename?: 'FleetSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type FleetTransaction = {
  __typename?: 'FleetTransaction';
  action: TransactionAction;
  amount: Scalars['Float'];
  currency: Scalars['String'];
  deductType?: Maybe<ProviderDeductTransactionType>;
  description?: Maybe<Scalars['String']>;
  fleetId: Scalars['ID'];
  id: Scalars['ID'];
  operator?: Maybe<Operator>;
  operatorId?: Maybe<Scalars['ID']>;
  rechargeType?: Maybe<ProviderRechargeTransactionType>;
  refrenceNumber?: Maybe<Scalars['String']>;
  requestId?: Maybe<Scalars['ID']>;
  transactionTimestamp: Scalars['DateTime'];
};

export type FleetTransactionAggregateFilter = {
  and?: InputMaybe<Array<FleetTransactionAggregateFilter>>;
  fleetId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  operatorId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<FleetTransactionAggregateFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type FleetTransactionAggregateGroupBy = {
  __typename?: 'FleetTransactionAggregateGroupBy';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FleetTransactionAvgAggregate = {
  __typename?: 'FleetTransactionAvgAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type FleetTransactionConnection = {
  __typename?: 'FleetTransactionConnection';
  /** Array of nodes. */
  nodes: Array<FleetTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FleetTransactionCountAggregate = {
  __typename?: 'FleetTransactionCountAggregate';
  fleetId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  operatorId?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type FleetTransactionFilter = {
  and?: InputMaybe<Array<FleetTransactionFilter>>;
  fleetId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  operatorId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<FleetTransactionFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type FleetTransactionInput = {
  action: TransactionAction;
  amount: Scalars['Float'];
  currency: Scalars['String'];
  deductType?: InputMaybe<ProviderDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  fleetId: Scalars['ID'];
  rechargeType?: InputMaybe<ProviderRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
};

export type FleetTransactionMaxAggregate = {
  __typename?: 'FleetTransactionMaxAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FleetTransactionMinAggregate = {
  __typename?: 'FleetTransactionMinAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type FleetTransactionSort = {
  direction: SortDirection;
  field: FleetTransactionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum FleetTransactionSortFields {
  FleetId = 'fleetId',
  Id = 'id',
  OperatorId = 'operatorId',
  RequestId = 'requestId'
}

export type FleetTransactionSumAggregate = {
  __typename?: 'FleetTransactionSumAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type FleetTransactionsConnection = {
  __typename?: 'FleetTransactionsConnection';
  /** Array of nodes. */
  nodes: Array<FleetTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FleetWallet = {
  __typename?: 'FleetWallet';
  balance: Scalars['Float'];
  currency: Scalars['String'];
  fleet: Fleet;
  fleetId: Scalars['ID'];
  id: Scalars['ID'];
};

export type FleetWalletAggregateGroupBy = {
  __typename?: 'FleetWalletAggregateGroupBy';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type FleetWalletAvgAggregate = {
  __typename?: 'FleetWalletAvgAggregate';
  balance?: Maybe<Scalars['Float']>;
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type FleetWalletConnection = {
  __typename?: 'FleetWalletConnection';
  /** Array of nodes. */
  nodes: Array<FleetWallet>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FleetWalletCountAggregate = {
  __typename?: 'FleetWalletCountAggregate';
  balance?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  fleetId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type FleetWalletFilter = {
  and?: InputMaybe<Array<FleetWalletFilter>>;
  balance?: InputMaybe<FloatFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  fleetId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<FleetWalletFilter>>;
};

export type FleetWalletMaxAggregate = {
  __typename?: 'FleetWalletMaxAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type FleetWalletMinAggregate = {
  __typename?: 'FleetWalletMinAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type FleetWalletSort = {
  direction: SortDirection;
  field: FleetWalletSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum FleetWalletSortFields {
  Balance = 'balance',
  Currency = 'currency',
  FleetId = 'fleetId',
  Id = 'id'
}

export type FleetWalletSumAggregate = {
  __typename?: 'FleetWalletSumAggregate';
  balance?: Maybe<Scalars['Float']>;
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type FleetZonePricesConnection = {
  __typename?: 'FleetZonePricesConnection';
  /** Array of nodes. */
  nodes: Array<ZonePrice>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type FloatFieldComparison = {
  between?: InputMaybe<FloatFieldComparisonBetween>;
  eq?: InputMaybe<Scalars['Float']>;
  gt?: InputMaybe<Scalars['Float']>;
  gte?: InputMaybe<Scalars['Float']>;
  in?: InputMaybe<Array<Scalars['Float']>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  lt?: InputMaybe<Scalars['Float']>;
  lte?: InputMaybe<Scalars['Float']>;
  neq?: InputMaybe<Scalars['Float']>;
  notBetween?: InputMaybe<FloatFieldComparisonBetween>;
  notIn?: InputMaybe<Array<Scalars['Float']>>;
};

export type FloatFieldComparisonBetween = {
  lower: Scalars['Float'];
  upper: Scalars['Float'];
};

export enum Gender {
  Female = 'Female',
  Male = 'Male',
  Unknown = 'Unknown'
}

export type IdFilterComparison = {
  eq?: InputMaybe<Scalars['ID']>;
  gt?: InputMaybe<Scalars['ID']>;
  gte?: InputMaybe<Scalars['ID']>;
  iLike?: InputMaybe<Scalars['ID']>;
  in?: InputMaybe<Array<Scalars['ID']>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  like?: InputMaybe<Scalars['ID']>;
  lt?: InputMaybe<Scalars['ID']>;
  lte?: InputMaybe<Scalars['ID']>;
  neq?: InputMaybe<Scalars['ID']>;
  notILike?: InputMaybe<Scalars['ID']>;
  notIn?: InputMaybe<Array<Scalars['ID']>>;
  notLike?: InputMaybe<Scalars['ID']>;
};

export type IncomeResultItem = {
  __typename?: 'IncomeResultItem';
  currency: Scalars['String'];
  sum: Scalars['Float'];
  time: Scalars['String'];
};

export type IncomeResults = {
  __typename?: 'IncomeResults';
  items: Array<IncomeResultItem>;
};

export type Media = {
  __typename?: 'Media';
  address: Scalars['String'];
  base64?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
};

export type MediaAggregateFilter = {
  and?: InputMaybe<Array<MediaAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<MediaAggregateFilter>>;
};

export type MediaAggregateGroupBy = {
  __typename?: 'MediaAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type MediaAvgAggregate = {
  __typename?: 'MediaAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type MediaCountAggregate = {
  __typename?: 'MediaCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type MediaEdge = {
  __typename?: 'MediaEdge';
  /** Cursor for this node. */
  cursor: Scalars['ConnectionCursor'];
  /** The node containing the Media */
  node: Media;
};

export type MediaFilter = {
  and?: InputMaybe<Array<MediaFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<MediaFilter>>;
};

export type MediaMaxAggregate = {
  __typename?: 'MediaMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type MediaMinAggregate = {
  __typename?: 'MediaMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type MediaSort = {
  direction: SortDirection;
  field: MediaSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum MediaSortFields {
  Id = 'id'
}

export type MediaSumAggregate = {
  __typename?: 'MediaSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum MessageStatus {
  Delivered = 'Delivered',
  Seen = 'Seen',
  Sent = 'Sent'
}

export type Mutation = {
  __typename?: 'Mutation';
  addActivitiesToComplaint: Complaint;
  addActivitiesToDistressSignal: DistressSignal;
  addAddressesToRider: Rider;
  addAllowedServicesToCoupon: Coupon;
  addComplaintsToOrder: Order;
  addConversationsToOrder: Order;
  addDocumentsToDriver: Driver;
  addDriverTransactionsToOrder: Order;
  addEnabledServicesToDriver: Driver;
  addFeedbacksToDriver: Driver;
  addFleetTransactionsToOrder: Order;
  addFleetsToZonePrice: ZonePrice;
  addOptionsToService: Service;
  addOrdersToDriver: Driver;
  addOrdersToRider: Rider;
  addParametersToFeedback: Feedback;
  addProviderTransactionsToOrder: Order;
  addRegionsToService: Service;
  addRiderTransactionsToOrder: Order;
  addServicesToServiceCategory: ServiceCategory;
  addServicesToZonePrice: ZonePrice;
  addTransactionsToDriver: Driver;
  addTransactionsToFleet: Fleet;
  addTransactionsToRider: Rider;
  addWalletsToDriver: Driver;
  addWalletsToFleet: Fleet;
  addWalletsToRider: Rider;
  addZonePricesToFleet: Fleet;
  assignDriverToOrder: Order;
  cancelOrder: Order;
  createDriverTransaction: DriverWallet;
  createFleetTransaction: FleetWallet;
  createManyComplaintActivities: Array<ComplaintActivity>;
  createOneAnnouncement: Announcement;
  createOneCarColor: CarColor;
  createOneCarModel: CarModel;
  createOneComplaintActivity: ComplaintActivity;
  createOneCoupon: Coupon;
  createOneDriver: Driver;
  createOneDriverTransaction: DriverTransaction;
  createOneFeedbackParameter: FeedbackParameter;
  createOneFleet: Fleet;
  createOneOperator: Operator;
  createOneOperatorRole: OperatorRole;
  createOnePaymentGateway: PaymentGateway;
  createOneProviderTransaction: ProviderTransaction;
  createOneRegion: Region;
  createOneReward: Reward;
  createOneRider: Rider;
  createOneRiderAddress: RiderAddress;
  createOneRiderTransaction: RiderTransaction;
  createOneSOSActivity: SosActivity;
  createOneService: Service;
  createOneServiceCategory: ServiceCategory;
  createOneServiceOption: ServiceOption;
  createOneZonePrice: ZonePrice;
  createOrder: Order;
  createRiderTransaction: RiderWallet;
  deleteOneAnnouncement: AnnouncementDeleteResponse;
  deleteOneCarColor: CarColorDeleteResponse;
  deleteOneCarModel: CarModelDeleteResponse;
  deleteOneDriver: Driver;
  deleteOneFeedbackParameter: FeedbackParameterDeleteResponse;
  deleteOneRegion: RegionDeleteResponse;
  deleteOneReward: RewardDeleteResponse;
  deleteOneRider: Rider;
  deleteOneService: ServiceDeleteResponse;
  deleteOneServiceCategory: ServiceCategoryDeleteResponse;
  deleteOneServiceOption: ServiceOptionDeleteResponse;
  deleteOneZonePrice: ZonePriceDeleteResponse;
  disablePreviousServer: UpdateConfigResult;
  removeActivitiesFromComplaint: Complaint;
  removeActivitiesFromDistressSignal: DistressSignal;
  removeActorFromComplaintActivity: ComplaintActivity;
  removeAddressesFromRider: Rider;
  removeAllowedServicesFromCoupon: Coupon;
  removeAssignedToFromComplaintActivity: ComplaintActivity;
  removeComplaintsFromOrder: Order;
  removeConversationsFromOrder: Order;
  removeCouponFromOrder: Order;
  removeDocumentsFromDriver: Driver;
  removeDriverFromDriverWallet: DriverWallet;
  removeDriverFromOrder: Order;
  removeDriverTransactionsFromOrder: Order;
  removeEnabledServicesFromDriver: Driver;
  removeFeedbacksFromDriver: Driver;
  removeFleetFromFleetWallet: FleetWallet;
  removeFleetTransactionsFromOrder: Order;
  removeFleetsFromZonePrice: ZonePrice;
  removeMediaFromDriver: Driver;
  removeMediaFromPaymentGateway: PaymentGateway;
  removeMediaFromRider: Rider;
  removeMediaFromService: Service;
  removeOperatorFromDriverTransaction: DriverTransaction;
  removeOperatorFromFleetTransaction: FleetTransaction;
  removeOperatorFromRiderTransaction: RiderTransaction;
  removeOperatorFromSOSActivity: SosActivity;
  removeOptionsFromService: Service;
  removeOrderFromComplaint: Complaint;
  removeOrderFromDistressSignal: DistressSignal;
  removeOrdersFromDriver: Driver;
  removeOrdersFromRider: Rider;
  removeParametersFromFeedback: Feedback;
  removePaymentGatewayFromRiderTransaction: RiderTransaction;
  removeProviderTransactionsFromOrder: Order;
  removeRegionsFromService: Service;
  removeRiderFromOrder: Order;
  removeRiderFromRiderTransaction: RiderTransaction;
  removeRiderFromRiderWallet: RiderWallet;
  removeRiderTransactionsFromOrder: Order;
  removeRoleFromOperator: Operator;
  removeServiceFromOrder: Order;
  removeServicesFromServiceCategory: ServiceCategory;
  removeServicesFromZonePrice: ZonePrice;
  removeTransactionsFromDriver: Driver;
  removeTransactionsFromFleet: Fleet;
  removeTransactionsFromRider: Rider;
  removeWalletsFromDriver: Driver;
  removeWalletsFromFleet: Fleet;
  removeWalletsFromRider: Rider;
  removeZonePricesFromFleet: Fleet;
  setActivitiesOnComplaint: Complaint;
  setActivitiesOnDistressSignal: DistressSignal;
  setActorOnComplaintActivity: ComplaintActivity;
  setAddressesOnRider: Rider;
  setAllowedServicesOnCoupon: Coupon;
  setAssignedToOnComplaintActivity: ComplaintActivity;
  setComplaintsOnOrder: Order;
  setConversationsOnOrder: Order;
  setCouponOnOrder: Order;
  setDocumentsOnDriver: Driver;
  setDriverOnDriverWallet: DriverWallet;
  setDriverOnOrder: Order;
  setDriverTransactionsOnOrder: Order;
  setEnabledServicesOnDriver: Driver;
  setFeedbacksOnDriver: Driver;
  setFleetOnFleetWallet: FleetWallet;
  setFleetTransactionsOnOrder: Order;
  setFleetsOnZonePrice: ZonePrice;
  setMediaOnDriver: Driver;
  setMediaOnPaymentGateway: PaymentGateway;
  setMediaOnRider: Rider;
  setMediaOnService: Service;
  setOperatorOnDriverTransaction: DriverTransaction;
  setOperatorOnFleetTransaction: FleetTransaction;
  setOperatorOnRiderTransaction: RiderTransaction;
  setOperatorOnSOSActivity: SosActivity;
  setOptionsOnService: Service;
  setOrderOnComplaint: Complaint;
  setOrderOnDistressSignal: DistressSignal;
  setOrdersOnDriver: Driver;
  setOrdersOnRider: Rider;
  setParametersOnFeedback: Feedback;
  setPaymentGatewayOnRiderTransaction: RiderTransaction;
  setProviderTransactionsOnOrder: Order;
  setRegionsOnService: Service;
  setRiderOnOrder: Order;
  setRiderOnRiderTransaction: RiderTransaction;
  setRiderOnRiderWallet: RiderWallet;
  setRiderTransactionsOnOrder: Order;
  setRoleOnOperator: Operator;
  setServiceOnOrder: Order;
  setServicesOnServiceCategory: ServiceCategory;
  setServicesOnZonePrice: ZonePrice;
  setTransactionsOnDriver: Driver;
  setTransactionsOnFleet: Fleet;
  setTransactionsOnRider: Rider;
  setWalletsOnDriver: Driver;
  setWalletsOnFleet: Fleet;
  setWalletsOnRider: Rider;
  setZonePricesOnFleet: Fleet;
  updateFirebase: UpdateConfigResult;
  updateManyRiderAddresses: UpdateManyResponse;
  updateMapsAPIKey: UpdateConfigResult;
  updateOneAnnouncement: Announcement;
  updateOneCarColor: CarColor;
  updateOneCarModel: CarModel;
  updateOneComplaint: Complaint;
  updateOneCoupon: Coupon;
  updateOneDriver: Driver;
  updateOneFeedback: Feedback;
  updateOneFeedbackParameter: FeedbackParameter;
  updateOneFleet: Fleet;
  updateOneOperator: Operator;
  updateOneOperatorRole: OperatorRole;
  updateOnePaymentGateway: PaymentGateway;
  updateOneRegion: Region;
  updateOneReward: Reward;
  updateOneRider: Rider;
  updateOneRiderAddress: RiderAddress;
  updateOneService: Service;
  updateOneServiceCategory: ServiceCategory;
  updateOneServiceOption: ServiceOption;
  updateOneZonePrice: ZonePrice;
  updatePassword: Operator;
  updatePurchaseCode: UpdatePurchaseCodeResult;
};


export type MutationAddActivitiesToComplaintArgs = {
  input: AddActivitiesToComplaintInput;
};


export type MutationAddActivitiesToDistressSignalArgs = {
  input: AddActivitiesToDistressSignalInput;
};


export type MutationAddAddressesToRiderArgs = {
  input: AddAddressesToRiderInput;
};


export type MutationAddAllowedServicesToCouponArgs = {
  input: AddAllowedServicesToCouponInput;
};


export type MutationAddComplaintsToOrderArgs = {
  input: AddComplaintsToOrderInput;
};


export type MutationAddConversationsToOrderArgs = {
  input: AddConversationsToOrderInput;
};


export type MutationAddDocumentsToDriverArgs = {
  input: AddDocumentsToDriverInput;
};


export type MutationAddDriverTransactionsToOrderArgs = {
  input: AddDriverTransactionsToOrderInput;
};


export type MutationAddEnabledServicesToDriverArgs = {
  input: AddEnabledServicesToDriverInput;
};


export type MutationAddFeedbacksToDriverArgs = {
  input: AddFeedbacksToDriverInput;
};


export type MutationAddFleetTransactionsToOrderArgs = {
  input: AddFleetTransactionsToOrderInput;
};


export type MutationAddFleetsToZonePriceArgs = {
  input: AddFleetsToZonePriceInput;
};


export type MutationAddOptionsToServiceArgs = {
  input: AddOptionsToServiceInput;
};


export type MutationAddOrdersToDriverArgs = {
  input: AddOrdersToDriverInput;
};


export type MutationAddOrdersToRiderArgs = {
  input: AddOrdersToRiderInput;
};


export type MutationAddParametersToFeedbackArgs = {
  input: AddParametersToFeedbackInput;
};


export type MutationAddProviderTransactionsToOrderArgs = {
  input: AddProviderTransactionsToOrderInput;
};


export type MutationAddRegionsToServiceArgs = {
  input: AddRegionsToServiceInput;
};


export type MutationAddRiderTransactionsToOrderArgs = {
  input: AddRiderTransactionsToOrderInput;
};


export type MutationAddServicesToServiceCategoryArgs = {
  input: AddServicesToServiceCategoryInput;
};


export type MutationAddServicesToZonePriceArgs = {
  input: AddServicesToZonePriceInput;
};


export type MutationAddTransactionsToDriverArgs = {
  input: AddTransactionsToDriverInput;
};


export type MutationAddTransactionsToFleetArgs = {
  input: AddTransactionsToFleetInput;
};


export type MutationAddTransactionsToRiderArgs = {
  input: AddTransactionsToRiderInput;
};


export type MutationAddWalletsToDriverArgs = {
  input: AddWalletsToDriverInput;
};


export type MutationAddWalletsToFleetArgs = {
  input: AddWalletsToFleetInput;
};


export type MutationAddWalletsToRiderArgs = {
  input: AddWalletsToRiderInput;
};


export type MutationAddZonePricesToFleetArgs = {
  input: AddZonePricesToFleetInput;
};


export type MutationAssignDriverToOrderArgs = {
  driverId: Scalars['ID'];
  orderId: Scalars['ID'];
};


export type MutationCancelOrderArgs = {
  orderId: Scalars['ID'];
};


export type MutationCreateDriverTransactionArgs = {
  input: DriverTransactionInput;
};


export type MutationCreateFleetTransactionArgs = {
  input: FleetTransactionInput;
};


export type MutationCreateManyComplaintActivitiesArgs = {
  input: CreateManyComplaintActivitiesInput;
};


export type MutationCreateOneAnnouncementArgs = {
  input: CreateOneAnnouncementInput;
};


export type MutationCreateOneCarColorArgs = {
  input: CreateOneCarColorInput;
};


export type MutationCreateOneCarModelArgs = {
  input: CreateOneCarModelInput;
};


export type MutationCreateOneComplaintActivityArgs = {
  input: CreateOneComplaintActivityInput;
};


export type MutationCreateOneCouponArgs = {
  input: CreateOneCouponInput;
};


export type MutationCreateOneDriverArgs = {
  input: CreateOneDriverInput;
};


export type MutationCreateOneDriverTransactionArgs = {
  input: CreateOneDriverTransactionInput;
};


export type MutationCreateOneFeedbackParameterArgs = {
  input: CreateOneFeedbackParameterInput;
};


export type MutationCreateOneFleetArgs = {
  input: CreateOneFleetInput;
};


export type MutationCreateOneOperatorArgs = {
  input: CreateOneOperatorInput;
};


export type MutationCreateOneOperatorRoleArgs = {
  input: CreateOneOperatorRoleInput;
};


export type MutationCreateOnePaymentGatewayArgs = {
  input: CreateOnePaymentGatewayInput;
};


export type MutationCreateOneProviderTransactionArgs = {
  input: CreateOneProviderTransactionInput;
};


export type MutationCreateOneRegionArgs = {
  input: CreateOneRegionInput;
};


export type MutationCreateOneRewardArgs = {
  input: CreateOneRewardInput;
};


export type MutationCreateOneRiderArgs = {
  input: CreateOneRiderInput;
};


export type MutationCreateOneRiderAddressArgs = {
  input: CreateOneRiderAddressInput;
};


export type MutationCreateOneRiderTransactionArgs = {
  input: CreateOneRiderTransactionInput;
};


export type MutationCreateOneSosActivityArgs = {
  input: CreateOneSosActivityInput;
};


export type MutationCreateOneServiceArgs = {
  input: CreateOneServiceInput;
};


export type MutationCreateOneServiceCategoryArgs = {
  input: CreateOneServiceCategoryInput;
};


export type MutationCreateOneServiceOptionArgs = {
  input: CreateOneServiceOptionInput;
};


export type MutationCreateOneZonePriceArgs = {
  input: CreateOneZonePriceInput;
};


export type MutationCreateOrderArgs = {
  input: CreateOrderInput;
};


export type MutationCreateRiderTransactionArgs = {
  input: RiderTransactionInput;
};


export type MutationDeleteOneAnnouncementArgs = {
  input: DeleteOneAnnouncementInput;
};


export type MutationDeleteOneCarColorArgs = {
  input: DeleteOneCarColorInput;
};


export type MutationDeleteOneCarModelArgs = {
  input: DeleteOneCarModelInput;
};


export type MutationDeleteOneDriverArgs = {
  id: Scalars['ID'];
};


export type MutationDeleteOneFeedbackParameterArgs = {
  input: DeleteOneFeedbackParameterInput;
};


export type MutationDeleteOneRegionArgs = {
  input: DeleteOneRegionInput;
};


export type MutationDeleteOneRewardArgs = {
  input: DeleteOneRewardInput;
};


export type MutationDeleteOneRiderArgs = {
  id: Scalars['ID'];
};


export type MutationDeleteOneServiceArgs = {
  input: DeleteOneServiceInput;
};


export type MutationDeleteOneServiceCategoryArgs = {
  input: DeleteOneServiceCategoryInput;
};


export type MutationDeleteOneServiceOptionArgs = {
  input: DeleteOneServiceOptionInput;
};


export type MutationDeleteOneZonePriceArgs = {
  input: DeleteOneZonePriceInput;
};


export type MutationDisablePreviousServerArgs = {
  ip: Scalars['String'];
};


export type MutationRemoveActivitiesFromComplaintArgs = {
  input: RemoveActivitiesFromComplaintInput;
};


export type MutationRemoveActivitiesFromDistressSignalArgs = {
  input: RemoveActivitiesFromDistressSignalInput;
};


export type MutationRemoveActorFromComplaintActivityArgs = {
  input: RemoveActorFromComplaintActivityInput;
};


export type MutationRemoveAddressesFromRiderArgs = {
  input: RemoveAddressesFromRiderInput;
};


export type MutationRemoveAllowedServicesFromCouponArgs = {
  input: RemoveAllowedServicesFromCouponInput;
};


export type MutationRemoveAssignedToFromComplaintActivityArgs = {
  input: RemoveAssignedToFromComplaintActivityInput;
};


export type MutationRemoveComplaintsFromOrderArgs = {
  input: RemoveComplaintsFromOrderInput;
};


export type MutationRemoveConversationsFromOrderArgs = {
  input: RemoveConversationsFromOrderInput;
};


export type MutationRemoveCouponFromOrderArgs = {
  input: RemoveCouponFromOrderInput;
};


export type MutationRemoveDocumentsFromDriverArgs = {
  input: RemoveDocumentsFromDriverInput;
};


export type MutationRemoveDriverFromDriverWalletArgs = {
  input: RemoveDriverFromDriverWalletInput;
};


export type MutationRemoveDriverFromOrderArgs = {
  input: RemoveDriverFromOrderInput;
};


export type MutationRemoveDriverTransactionsFromOrderArgs = {
  input: RemoveDriverTransactionsFromOrderInput;
};


export type MutationRemoveEnabledServicesFromDriverArgs = {
  input: RemoveEnabledServicesFromDriverInput;
};


export type MutationRemoveFeedbacksFromDriverArgs = {
  input: RemoveFeedbacksFromDriverInput;
};


export type MutationRemoveFleetFromFleetWalletArgs = {
  input: RemoveFleetFromFleetWalletInput;
};


export type MutationRemoveFleetTransactionsFromOrderArgs = {
  input: RemoveFleetTransactionsFromOrderInput;
};


export type MutationRemoveFleetsFromZonePriceArgs = {
  input: RemoveFleetsFromZonePriceInput;
};


export type MutationRemoveMediaFromDriverArgs = {
  input: RemoveMediaFromDriverInput;
};


export type MutationRemoveMediaFromPaymentGatewayArgs = {
  input: RemoveMediaFromPaymentGatewayInput;
};


export type MutationRemoveMediaFromRiderArgs = {
  input: RemoveMediaFromRiderInput;
};


export type MutationRemoveMediaFromServiceArgs = {
  input: RemoveMediaFromServiceInput;
};


export type MutationRemoveOperatorFromDriverTransactionArgs = {
  input: RemoveOperatorFromDriverTransactionInput;
};


export type MutationRemoveOperatorFromFleetTransactionArgs = {
  input: RemoveOperatorFromFleetTransactionInput;
};


export type MutationRemoveOperatorFromRiderTransactionArgs = {
  input: RemoveOperatorFromRiderTransactionInput;
};


export type MutationRemoveOperatorFromSosActivityArgs = {
  input: RemoveOperatorFromSosActivityInput;
};


export type MutationRemoveOptionsFromServiceArgs = {
  input: RemoveOptionsFromServiceInput;
};


export type MutationRemoveOrderFromComplaintArgs = {
  input: RemoveOrderFromComplaintInput;
};


export type MutationRemoveOrderFromDistressSignalArgs = {
  input: RemoveOrderFromDistressSignalInput;
};


export type MutationRemoveOrdersFromDriverArgs = {
  input: RemoveOrdersFromDriverInput;
};


export type MutationRemoveOrdersFromRiderArgs = {
  input: RemoveOrdersFromRiderInput;
};


export type MutationRemoveParametersFromFeedbackArgs = {
  input: RemoveParametersFromFeedbackInput;
};


export type MutationRemovePaymentGatewayFromRiderTransactionArgs = {
  input: RemovePaymentGatewayFromRiderTransactionInput;
};


export type MutationRemoveProviderTransactionsFromOrderArgs = {
  input: RemoveProviderTransactionsFromOrderInput;
};


export type MutationRemoveRegionsFromServiceArgs = {
  input: RemoveRegionsFromServiceInput;
};


export type MutationRemoveRiderFromOrderArgs = {
  input: RemoveRiderFromOrderInput;
};


export type MutationRemoveRiderFromRiderTransactionArgs = {
  input: RemoveRiderFromRiderTransactionInput;
};


export type MutationRemoveRiderFromRiderWalletArgs = {
  input: RemoveRiderFromRiderWalletInput;
};


export type MutationRemoveRiderTransactionsFromOrderArgs = {
  input: RemoveRiderTransactionsFromOrderInput;
};


export type MutationRemoveRoleFromOperatorArgs = {
  input: RemoveRoleFromOperatorInput;
};


export type MutationRemoveServiceFromOrderArgs = {
  input: RemoveServiceFromOrderInput;
};


export type MutationRemoveServicesFromServiceCategoryArgs = {
  input: RemoveServicesFromServiceCategoryInput;
};


export type MutationRemoveServicesFromZonePriceArgs = {
  input: RemoveServicesFromZonePriceInput;
};


export type MutationRemoveTransactionsFromDriverArgs = {
  input: RemoveTransactionsFromDriverInput;
};


export type MutationRemoveTransactionsFromFleetArgs = {
  input: RemoveTransactionsFromFleetInput;
};


export type MutationRemoveTransactionsFromRiderArgs = {
  input: RemoveTransactionsFromRiderInput;
};


export type MutationRemoveWalletsFromDriverArgs = {
  input: RemoveWalletsFromDriverInput;
};


export type MutationRemoveWalletsFromFleetArgs = {
  input: RemoveWalletsFromFleetInput;
};


export type MutationRemoveWalletsFromRiderArgs = {
  input: RemoveWalletsFromRiderInput;
};


export type MutationRemoveZonePricesFromFleetArgs = {
  input: RemoveZonePricesFromFleetInput;
};


export type MutationSetActivitiesOnComplaintArgs = {
  input: SetActivitiesOnComplaintInput;
};


export type MutationSetActivitiesOnDistressSignalArgs = {
  input: SetActivitiesOnDistressSignalInput;
};


export type MutationSetActorOnComplaintActivityArgs = {
  input: SetActorOnComplaintActivityInput;
};


export type MutationSetAddressesOnRiderArgs = {
  input: SetAddressesOnRiderInput;
};


export type MutationSetAllowedServicesOnCouponArgs = {
  input: SetAllowedServicesOnCouponInput;
};


export type MutationSetAssignedToOnComplaintActivityArgs = {
  input: SetAssignedToOnComplaintActivityInput;
};


export type MutationSetComplaintsOnOrderArgs = {
  input: SetComplaintsOnOrderInput;
};


export type MutationSetConversationsOnOrderArgs = {
  input: SetConversationsOnOrderInput;
};


export type MutationSetCouponOnOrderArgs = {
  input: SetCouponOnOrderInput;
};


export type MutationSetDocumentsOnDriverArgs = {
  input: SetDocumentsOnDriverInput;
};


export type MutationSetDriverOnDriverWalletArgs = {
  input: SetDriverOnDriverWalletInput;
};


export type MutationSetDriverOnOrderArgs = {
  input: SetDriverOnOrderInput;
};


export type MutationSetDriverTransactionsOnOrderArgs = {
  input: SetDriverTransactionsOnOrderInput;
};


export type MutationSetEnabledServicesOnDriverArgs = {
  input: SetEnabledServicesOnDriverInput;
};


export type MutationSetFeedbacksOnDriverArgs = {
  input: SetFeedbacksOnDriverInput;
};


export type MutationSetFleetOnFleetWalletArgs = {
  input: SetFleetOnFleetWalletInput;
};


export type MutationSetFleetTransactionsOnOrderArgs = {
  input: SetFleetTransactionsOnOrderInput;
};


export type MutationSetFleetsOnZonePriceArgs = {
  input: SetFleetsOnZonePriceInput;
};


export type MutationSetMediaOnDriverArgs = {
  input: SetMediaOnDriverInput;
};


export type MutationSetMediaOnPaymentGatewayArgs = {
  input: SetMediaOnPaymentGatewayInput;
};


export type MutationSetMediaOnRiderArgs = {
  input: SetMediaOnRiderInput;
};


export type MutationSetMediaOnServiceArgs = {
  input: SetMediaOnServiceInput;
};


export type MutationSetOperatorOnDriverTransactionArgs = {
  input: SetOperatorOnDriverTransactionInput;
};


export type MutationSetOperatorOnFleetTransactionArgs = {
  input: SetOperatorOnFleetTransactionInput;
};


export type MutationSetOperatorOnRiderTransactionArgs = {
  input: SetOperatorOnRiderTransactionInput;
};


export type MutationSetOperatorOnSosActivityArgs = {
  input: SetOperatorOnSosActivityInput;
};


export type MutationSetOptionsOnServiceArgs = {
  input: SetOptionsOnServiceInput;
};


export type MutationSetOrderOnComplaintArgs = {
  input: SetOrderOnComplaintInput;
};


export type MutationSetOrderOnDistressSignalArgs = {
  input: SetOrderOnDistressSignalInput;
};


export type MutationSetOrdersOnDriverArgs = {
  input: SetOrdersOnDriverInput;
};


export type MutationSetOrdersOnRiderArgs = {
  input: SetOrdersOnRiderInput;
};


export type MutationSetParametersOnFeedbackArgs = {
  input: SetParametersOnFeedbackInput;
};


export type MutationSetPaymentGatewayOnRiderTransactionArgs = {
  input: SetPaymentGatewayOnRiderTransactionInput;
};


export type MutationSetProviderTransactionsOnOrderArgs = {
  input: SetProviderTransactionsOnOrderInput;
};


export type MutationSetRegionsOnServiceArgs = {
  input: SetRegionsOnServiceInput;
};


export type MutationSetRiderOnOrderArgs = {
  input: SetRiderOnOrderInput;
};


export type MutationSetRiderOnRiderTransactionArgs = {
  input: SetRiderOnRiderTransactionInput;
};


export type MutationSetRiderOnRiderWalletArgs = {
  input: SetRiderOnRiderWalletInput;
};


export type MutationSetRiderTransactionsOnOrderArgs = {
  input: SetRiderTransactionsOnOrderInput;
};


export type MutationSetRoleOnOperatorArgs = {
  input: SetRoleOnOperatorInput;
};


export type MutationSetServiceOnOrderArgs = {
  input: SetServiceOnOrderInput;
};


export type MutationSetServicesOnServiceCategoryArgs = {
  input: SetServicesOnServiceCategoryInput;
};


export type MutationSetServicesOnZonePriceArgs = {
  input: SetServicesOnZonePriceInput;
};


export type MutationSetTransactionsOnDriverArgs = {
  input: SetTransactionsOnDriverInput;
};


export type MutationSetTransactionsOnFleetArgs = {
  input: SetTransactionsOnFleetInput;
};


export type MutationSetTransactionsOnRiderArgs = {
  input: SetTransactionsOnRiderInput;
};


export type MutationSetWalletsOnDriverArgs = {
  input: SetWalletsOnDriverInput;
};


export type MutationSetWalletsOnFleetArgs = {
  input: SetWalletsOnFleetInput;
};


export type MutationSetWalletsOnRiderArgs = {
  input: SetWalletsOnRiderInput;
};


export type MutationSetZonePricesOnFleetArgs = {
  input: SetZonePricesOnFleetInput;
};


export type MutationUpdateFirebaseArgs = {
  keyFileName: Scalars['String'];
};


export type MutationUpdateManyRiderAddressesArgs = {
  input: UpdateManyRiderAddressesInput;
};


export type MutationUpdateMapsApiKeyArgs = {
  adminPanel: Scalars['String'];
  backend: Scalars['String'];
};


export type MutationUpdateOneAnnouncementArgs = {
  input: UpdateOneAnnouncementInput;
};


export type MutationUpdateOneCarColorArgs = {
  input: UpdateOneCarColorInput;
};


export type MutationUpdateOneCarModelArgs = {
  input: UpdateOneCarModelInput;
};


export type MutationUpdateOneComplaintArgs = {
  input: UpdateOneComplaintInput;
};


export type MutationUpdateOneCouponArgs = {
  input: UpdateOneCouponInput;
};


export type MutationUpdateOneDriverArgs = {
  input: UpdateOneDriverInput;
};


export type MutationUpdateOneFeedbackArgs = {
  input: UpdateOneFeedbackInput;
};


export type MutationUpdateOneFeedbackParameterArgs = {
  input: UpdateOneFeedbackParameterInput;
};


export type MutationUpdateOneFleetArgs = {
  input: UpdateOneFleetInput;
};


export type MutationUpdateOneOperatorArgs = {
  input: UpdateOneOperatorInput;
};


export type MutationUpdateOneOperatorRoleArgs = {
  input: UpdateOneOperatorRoleInput;
};


export type MutationUpdateOnePaymentGatewayArgs = {
  input: UpdateOnePaymentGatewayInput;
};


export type MutationUpdateOneRegionArgs = {
  input: UpdateOneRegionInput;
};


export type MutationUpdateOneRewardArgs = {
  input: UpdateOneRewardInput;
};


export type MutationUpdateOneRiderArgs = {
  input: UpdateOneRiderInput;
};


export type MutationUpdateOneRiderAddressArgs = {
  input: UpdateOneRiderAddressInput;
};


export type MutationUpdateOneServiceArgs = {
  input: UpdateOneServiceInput;
};


export type MutationUpdateOneServiceCategoryArgs = {
  input: UpdateOneServiceCategoryInput;
};


export type MutationUpdateOneServiceOptionArgs = {
  input: UpdateOneServiceOptionInput;
};


export type MutationUpdateOneZonePriceArgs = {
  input: UpdateOneZonePriceInput;
};


export type MutationUpdatePasswordArgs = {
  input: UpdatePasswordInput;
};


export type MutationUpdatePurchaseCodeArgs = {
  purchaseCode: Scalars['String'];
};

export type OffsetPageInfo = {
  __typename?: 'OffsetPageInfo';
  /** true if paging forward and there are more records. */
  hasNextPage?: Maybe<Scalars['Boolean']>;
  /** true if paging backwards and there are more records. */
  hasPreviousPage?: Maybe<Scalars['Boolean']>;
};

export type OffsetPaging = {
  /** Limit the number of records returned */
  limit?: InputMaybe<Scalars['Int']>;
  /** Offset to start returning records from */
  offset?: InputMaybe<Scalars['Int']>;
};

export type OnlineDriver = {
  __typename?: 'OnlineDriver';
  driverId: Scalars['Float'];
  lastUpdatedAt: Scalars['Float'];
  location: Point;
};

export type OnlineDriverWithData = {
  __typename?: 'OnlineDriverWithData';
  firstName?: Maybe<Scalars['String']>;
  gender?: Maybe<Gender>;
  id: Scalars['Float'];
  lastName?: Maybe<Scalars['String']>;
  lastUpdatedAt: Scalars['Float'];
  location: Point;
  mobileNumber: Scalars['String'];
  rating?: Maybe<Scalars['Float']>;
  reviewCount: Scalars['Float'];
  status: DriverStatus;
};

export type Operator = {
  __typename?: 'Operator';
  email?: Maybe<Scalars['String']>;
  firstName?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
  role?: Maybe<OperatorRole>;
  roleId?: Maybe<Scalars['ID']>;
  userName: Scalars['String'];
};

export type OperatorAggregateGroupBy = {
  __typename?: 'OperatorAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type OperatorAvgAggregate = {
  __typename?: 'OperatorAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OperatorConnection = {
  __typename?: 'OperatorConnection';
  /** Array of nodes. */
  nodes: Array<Operator>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type OperatorCountAggregate = {
  __typename?: 'OperatorCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type OperatorFilter = {
  and?: InputMaybe<Array<OperatorFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OperatorFilter>>;
};

export type OperatorMaxAggregate = {
  __typename?: 'OperatorMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OperatorMinAggregate = {
  __typename?: 'OperatorMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export enum OperatorPermission {
  AnnouncementsEdit = 'Announcements_Edit',
  AnnouncementsView = 'Announcements_View',
  CarsEdit = 'Cars_Edit',
  CarsView = 'Cars_View',
  ComplaintsEdit = 'Complaints_Edit',
  ComplaintsView = 'Complaints_View',
  CouponsEdit = 'Coupons_Edit',
  CouponsView = 'Coupons_View',
  DriverWalletEdit = 'DriverWallet_Edit',
  DriverWalletView = 'DriverWallet_View',
  DriversEdit = 'Drivers_Edit',
  DriversView = 'Drivers_View',
  FleetWalletEdit = 'FleetWallet_Edit',
  FleetWalletView = 'FleetWallet_View',
  FleetsEdit = 'Fleets_Edit',
  FleetsView = 'Fleets_View',
  GatewaysEdit = 'Gateways_Edit',
  GatewaysView = 'Gateways_View',
  ProviderWalletEdit = 'ProviderWallet_Edit',
  ProviderWalletView = 'ProviderWallet_View',
  RegionsEdit = 'Regions_Edit',
  RegionsView = 'Regions_View',
  RequestsView = 'Requests_View',
  ReviewParameterEdit = 'ReviewParameter_Edit',
  RiderWalletEdit = 'RiderWallet_Edit',
  RiderWalletView = 'RiderWallet_View',
  RidersEdit = 'Riders_Edit',
  RidersView = 'Riders_View',
  ServicesEdit = 'Services_Edit',
  ServicesView = 'Services_View',
  UsersEdit = 'Users_Edit',
  UsersView = 'Users_View'
}

export type OperatorRole = {
  __typename?: 'OperatorRole';
  id: Scalars['ID'];
  permissions: Array<OperatorPermission>;
  title: Scalars['String'];
};

export type OperatorRoleAggregateGroupBy = {
  __typename?: 'OperatorRoleAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type OperatorRoleAvgAggregate = {
  __typename?: 'OperatorRoleAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OperatorRoleCountAggregate = {
  __typename?: 'OperatorRoleCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type OperatorRoleFilter = {
  and?: InputMaybe<Array<OperatorRoleFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OperatorRoleFilter>>;
};

export type OperatorRoleMaxAggregate = {
  __typename?: 'OperatorRoleMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OperatorRoleMinAggregate = {
  __typename?: 'OperatorRoleMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OperatorRoleSort = {
  direction: SortDirection;
  field: OperatorRoleSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum OperatorRoleSortFields {
  Id = 'id'
}

export type OperatorRoleSumAggregate = {
  __typename?: 'OperatorRoleSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OperatorSort = {
  direction: SortDirection;
  field: OperatorSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum OperatorSortFields {
  Id = 'id'
}

export type OperatorSumAggregate = {
  __typename?: 'OperatorSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type Order = {
  __typename?: 'Order';
  activities: Array<RequestActivity>;
  activitiesAggregate: Array<OrderActivitiesAggregateResponse>;
  addresses: Array<Scalars['String']>;
  complaints: Array<Complaint>;
  complaintsAggregate: Array<OrderComplaintsAggregateResponse>;
  conversations: Array<OrderMessage>;
  conversationsAggregate: Array<OrderConversationsAggregateResponse>;
  costAfterCoupon: Scalars['Float'];
  costBest: Scalars['Float'];
  coupon?: Maybe<Coupon>;
  createdOn: Scalars['DateTime'];
  currency: Scalars['String'];
  distanceBest: Scalars['Int'];
  driver?: Maybe<Driver>;
  driverId?: Maybe<Scalars['ID']>;
  driverTransactions: Array<DriverTransaction>;
  driverTransactionsAggregate: Array<OrderDriverTransactionsAggregateResponse>;
  durationBest: Scalars['Int'];
  expectedTimestamp?: Maybe<Scalars['DateTime']>;
  finishTimestamp?: Maybe<Scalars['DateTime']>;
  fleetTransactions: Array<FleetTransaction>;
  fleetTransactionsAggregate: Array<OrderFleetTransactionsAggregateResponse>;
  id: Scalars['ID'];
  points: Array<Point>;
  providerTransactions: Array<ProviderTransaction>;
  providerTransactionsAggregate: Array<OrderProviderTransactionsAggregateResponse>;
  rider?: Maybe<Rider>;
  riderId: Scalars['ID'];
  riderTransactions: Array<RiderTransaction>;
  riderTransactionsAggregate: Array<OrderRiderTransactionsAggregateResponse>;
  service?: Maybe<Service>;
  startTimestamp?: Maybe<Scalars['DateTime']>;
  status: OrderStatus;
  waitMinutes: Scalars['Float'];
};


export type OrderActivitiesArgs = {
  filter?: InputMaybe<RequestActivityFilter>;
  sorting?: InputMaybe<Array<RequestActivitySort>>;
};


export type OrderActivitiesAggregateArgs = {
  filter?: InputMaybe<RequestActivityAggregateFilter>;
};


export type OrderComplaintsArgs = {
  filter?: InputMaybe<ComplaintFilter>;
  sorting?: InputMaybe<Array<ComplaintSort>>;
};


export type OrderComplaintsAggregateArgs = {
  filter?: InputMaybe<ComplaintAggregateFilter>;
};


export type OrderConversationsArgs = {
  filter?: InputMaybe<OrderMessageFilter>;
  sorting?: InputMaybe<Array<OrderMessageSort>>;
};


export type OrderConversationsAggregateArgs = {
  filter?: InputMaybe<OrderMessageAggregateFilter>;
};


export type OrderDriverTransactionsArgs = {
  filter?: InputMaybe<DriverTransactionFilter>;
  sorting?: InputMaybe<Array<DriverTransactionSort>>;
};


export type OrderDriverTransactionsAggregateArgs = {
  filter?: InputMaybe<DriverTransactionAggregateFilter>;
};


export type OrderFleetTransactionsArgs = {
  filter?: InputMaybe<FleetTransactionFilter>;
  sorting?: InputMaybe<Array<FleetTransactionSort>>;
};


export type OrderFleetTransactionsAggregateArgs = {
  filter?: InputMaybe<FleetTransactionAggregateFilter>;
};


export type OrderProviderTransactionsArgs = {
  filter?: InputMaybe<ProviderTransactionFilter>;
  sorting?: InputMaybe<Array<ProviderTransactionSort>>;
};


export type OrderProviderTransactionsAggregateArgs = {
  filter?: InputMaybe<ProviderTransactionAggregateFilter>;
};


export type OrderRiderTransactionsArgs = {
  filter?: InputMaybe<RiderTransactionFilter>;
  sorting?: InputMaybe<Array<RiderTransactionSort>>;
};


export type OrderRiderTransactionsAggregateArgs = {
  filter?: InputMaybe<RiderTransactionAggregateFilter>;
};

export type OrderActivitiesAggregateGroupBy = {
  __typename?: 'OrderActivitiesAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type OrderActivitiesAggregateResponse = {
  __typename?: 'OrderActivitiesAggregateResponse';
  avg?: Maybe<OrderActivitiesAvgAggregate>;
  count?: Maybe<OrderActivitiesCountAggregate>;
  groupBy?: Maybe<OrderActivitiesAggregateGroupBy>;
  max?: Maybe<OrderActivitiesMaxAggregate>;
  min?: Maybe<OrderActivitiesMinAggregate>;
  sum?: Maybe<OrderActivitiesSumAggregate>;
};

export type OrderActivitiesAvgAggregate = {
  __typename?: 'OrderActivitiesAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderActivitiesCountAggregate = {
  __typename?: 'OrderActivitiesCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type OrderActivitiesMaxAggregate = {
  __typename?: 'OrderActivitiesMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderActivitiesMinAggregate = {
  __typename?: 'OrderActivitiesMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderActivitiesSumAggregate = {
  __typename?: 'OrderActivitiesSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderAggregateFilter = {
  and?: InputMaybe<Array<OrderAggregateFilter>>;
  createdOn?: InputMaybe<DateFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OrderAggregateFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
  status?: InputMaybe<OrderStatusFilterComparison>;
};

export type OrderAggregateGroupBy = {
  __typename?: 'OrderAggregateGroupBy';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type OrderAggregateResponse = {
  __typename?: 'OrderAggregateResponse';
  avg?: Maybe<OrderAvgAggregate>;
  count?: Maybe<OrderCountAggregate>;
  groupBy?: Maybe<OrderAggregateGroupBy>;
  max?: Maybe<OrderMaxAggregate>;
  min?: Maybe<OrderMinAggregate>;
  sum?: Maybe<OrderSumAggregate>;
};

export type OrderAvgAggregate = {
  __typename?: 'OrderAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type OrderComplaintsAggregateGroupBy = {
  __typename?: 'OrderComplaintsAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type OrderComplaintsAggregateResponse = {
  __typename?: 'OrderComplaintsAggregateResponse';
  avg?: Maybe<OrderComplaintsAvgAggregate>;
  count?: Maybe<OrderComplaintsCountAggregate>;
  groupBy?: Maybe<OrderComplaintsAggregateGroupBy>;
  max?: Maybe<OrderComplaintsMaxAggregate>;
  min?: Maybe<OrderComplaintsMinAggregate>;
  sum?: Maybe<OrderComplaintsSumAggregate>;
};

export type OrderComplaintsAvgAggregate = {
  __typename?: 'OrderComplaintsAvgAggregate';
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderComplaintsCountAggregate = {
  __typename?: 'OrderComplaintsCountAggregate';
  id?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
  status?: Maybe<Scalars['Int']>;
};

export type OrderComplaintsMaxAggregate = {
  __typename?: 'OrderComplaintsMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type OrderComplaintsMinAggregate = {
  __typename?: 'OrderComplaintsMinAggregate';
  id?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
  status?: Maybe<ComplaintStatus>;
};

export type OrderComplaintsSumAggregate = {
  __typename?: 'OrderComplaintsSumAggregate';
  id?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderConnection = {
  __typename?: 'OrderConnection';
  /** Array of nodes. */
  nodes: Array<Order>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type OrderConversationsAggregateGroupBy = {
  __typename?: 'OrderConversationsAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type OrderConversationsAggregateResponse = {
  __typename?: 'OrderConversationsAggregateResponse';
  avg?: Maybe<OrderConversationsAvgAggregate>;
  count?: Maybe<OrderConversationsCountAggregate>;
  groupBy?: Maybe<OrderConversationsAggregateGroupBy>;
  max?: Maybe<OrderConversationsMaxAggregate>;
  min?: Maybe<OrderConversationsMinAggregate>;
  sum?: Maybe<OrderConversationsSumAggregate>;
};

export type OrderConversationsAvgAggregate = {
  __typename?: 'OrderConversationsAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderConversationsCountAggregate = {
  __typename?: 'OrderConversationsCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type OrderConversationsMaxAggregate = {
  __typename?: 'OrderConversationsMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderConversationsMinAggregate = {
  __typename?: 'OrderConversationsMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderConversationsSumAggregate = {
  __typename?: 'OrderConversationsSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderCountAggregate = {
  __typename?: 'OrderCountAggregate';
  createdOn?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
  status?: Maybe<Scalars['Int']>;
};

export type OrderDriverTransactionsAggregateGroupBy = {
  __typename?: 'OrderDriverTransactionsAggregateGroupBy';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type OrderDriverTransactionsAggregateResponse = {
  __typename?: 'OrderDriverTransactionsAggregateResponse';
  avg?: Maybe<OrderDriverTransactionsAvgAggregate>;
  count?: Maybe<OrderDriverTransactionsCountAggregate>;
  groupBy?: Maybe<OrderDriverTransactionsAggregateGroupBy>;
  max?: Maybe<OrderDriverTransactionsMaxAggregate>;
  min?: Maybe<OrderDriverTransactionsMinAggregate>;
  sum?: Maybe<OrderDriverTransactionsSumAggregate>;
};

export type OrderDriverTransactionsAvgAggregate = {
  __typename?: 'OrderDriverTransactionsAvgAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type OrderDriverTransactionsCountAggregate = {
  __typename?: 'OrderDriverTransactionsCountAggregate';
  createdAt?: Maybe<Scalars['Int']>;
  driverId?: Maybe<Scalars['Int']>;
};

export type OrderDriverTransactionsMaxAggregate = {
  __typename?: 'OrderDriverTransactionsMaxAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type OrderDriverTransactionsMinAggregate = {
  __typename?: 'OrderDriverTransactionsMinAggregate';
  createdAt?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
};

export type OrderDriverTransactionsSumAggregate = {
  __typename?: 'OrderDriverTransactionsSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
};

export type OrderFilter = {
  and?: InputMaybe<Array<OrderFilter>>;
  createdOn?: InputMaybe<DateFieldComparison>;
  driverId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OrderFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
  status?: InputMaybe<OrderStatusFilterComparison>;
};

export type OrderFleetTransactionsAggregateGroupBy = {
  __typename?: 'OrderFleetTransactionsAggregateGroupBy';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderFleetTransactionsAggregateResponse = {
  __typename?: 'OrderFleetTransactionsAggregateResponse';
  avg?: Maybe<OrderFleetTransactionsAvgAggregate>;
  count?: Maybe<OrderFleetTransactionsCountAggregate>;
  groupBy?: Maybe<OrderFleetTransactionsAggregateGroupBy>;
  max?: Maybe<OrderFleetTransactionsMaxAggregate>;
  min?: Maybe<OrderFleetTransactionsMinAggregate>;
  sum?: Maybe<OrderFleetTransactionsSumAggregate>;
};

export type OrderFleetTransactionsAvgAggregate = {
  __typename?: 'OrderFleetTransactionsAvgAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderFleetTransactionsCountAggregate = {
  __typename?: 'OrderFleetTransactionsCountAggregate';
  fleetId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  operatorId?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type OrderFleetTransactionsMaxAggregate = {
  __typename?: 'OrderFleetTransactionsMaxAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderFleetTransactionsMinAggregate = {
  __typename?: 'OrderFleetTransactionsMinAggregate';
  fleetId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderFleetTransactionsSumAggregate = {
  __typename?: 'OrderFleetTransactionsSumAggregate';
  fleetId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderMaxAggregate = {
  __typename?: 'OrderMaxAggregate';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type OrderMessage = {
  __typename?: 'OrderMessage';
  content: Scalars['String'];
  id: Scalars['ID'];
  sentAt: Scalars['DateTime'];
  sentByDriver: Scalars['Boolean'];
  status: MessageStatus;
};

export type OrderMessageAggregateFilter = {
  and?: InputMaybe<Array<OrderMessageAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OrderMessageAggregateFilter>>;
};

export type OrderMessageAggregateGroupBy = {
  __typename?: 'OrderMessageAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type OrderMessageAvgAggregate = {
  __typename?: 'OrderMessageAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderMessageCountAggregate = {
  __typename?: 'OrderMessageCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type OrderMessageFilter = {
  and?: InputMaybe<Array<OrderMessageFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<OrderMessageFilter>>;
};

export type OrderMessageMaxAggregate = {
  __typename?: 'OrderMessageMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderMessageMinAggregate = {
  __typename?: 'OrderMessageMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type OrderMessageSort = {
  direction: SortDirection;
  field: OrderMessageSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum OrderMessageSortFields {
  Id = 'id'
}

export type OrderMessageSumAggregate = {
  __typename?: 'OrderMessageSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type OrderMinAggregate = {
  __typename?: 'OrderMinAggregate';
  createdOn?: Maybe<Scalars['DateTime']>;
  driverId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
  status?: Maybe<OrderStatus>;
};

export type OrderProviderTransactionsAggregateGroupBy = {
  __typename?: 'OrderProviderTransactionsAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderProviderTransactionsAggregateResponse = {
  __typename?: 'OrderProviderTransactionsAggregateResponse';
  avg?: Maybe<OrderProviderTransactionsAvgAggregate>;
  count?: Maybe<OrderProviderTransactionsCountAggregate>;
  groupBy?: Maybe<OrderProviderTransactionsAggregateGroupBy>;
  max?: Maybe<OrderProviderTransactionsMaxAggregate>;
  min?: Maybe<OrderProviderTransactionsMinAggregate>;
  sum?: Maybe<OrderProviderTransactionsSumAggregate>;
};

export type OrderProviderTransactionsAvgAggregate = {
  __typename?: 'OrderProviderTransactionsAvgAggregate';
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderProviderTransactionsCountAggregate = {
  __typename?: 'OrderProviderTransactionsCountAggregate';
  id?: Maybe<Scalars['Int']>;
  operatorId?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type OrderProviderTransactionsMaxAggregate = {
  __typename?: 'OrderProviderTransactionsMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderProviderTransactionsMinAggregate = {
  __typename?: 'OrderProviderTransactionsMinAggregate';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type OrderProviderTransactionsSumAggregate = {
  __typename?: 'OrderProviderTransactionsSumAggregate';
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type OrderRiderTransactionsAggregateGroupBy = {
  __typename?: 'OrderRiderTransactionsAggregateGroupBy';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type OrderRiderTransactionsAggregateResponse = {
  __typename?: 'OrderRiderTransactionsAggregateResponse';
  avg?: Maybe<OrderRiderTransactionsAvgAggregate>;
  count?: Maybe<OrderRiderTransactionsCountAggregate>;
  groupBy?: Maybe<OrderRiderTransactionsAggregateGroupBy>;
  max?: Maybe<OrderRiderTransactionsMaxAggregate>;
  min?: Maybe<OrderRiderTransactionsMinAggregate>;
  sum?: Maybe<OrderRiderTransactionsSumAggregate>;
};

export type OrderRiderTransactionsAvgAggregate = {
  __typename?: 'OrderRiderTransactionsAvgAggregate';
  amount?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type OrderRiderTransactionsCountAggregate = {
  __typename?: 'OrderRiderTransactionsCountAggregate';
  amount?: Maybe<Scalars['Int']>;
  createdAt?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
};

export type OrderRiderTransactionsMaxAggregate = {
  __typename?: 'OrderRiderTransactionsMaxAggregate';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type OrderRiderTransactionsMinAggregate = {
  __typename?: 'OrderRiderTransactionsMinAggregate';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type OrderRiderTransactionsSumAggregate = {
  __typename?: 'OrderRiderTransactionsSumAggregate';
  amount?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type OrderSort = {
  direction: SortDirection;
  field: OrderSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum OrderSortFields {
  CreatedOn = 'createdOn',
  DriverId = 'driverId',
  Id = 'id',
  RiderId = 'riderId',
  Status = 'status'
}

export enum OrderStatus {
  Arrived = 'Arrived',
  Booked = 'Booked',
  DriverAccepted = 'DriverAccepted',
  DriverCanceled = 'DriverCanceled',
  Expired = 'Expired',
  Finished = 'Finished',
  Found = 'Found',
  NoCloseFound = 'NoCloseFound',
  NotFound = 'NotFound',
  Requested = 'Requested',
  RiderCanceled = 'RiderCanceled',
  Started = 'Started',
  WaitingForPostPay = 'WaitingForPostPay',
  WaitingForPrePay = 'WaitingForPrePay',
  WaitingForReview = 'WaitingForReview'
}

export type OrderStatusFilterComparison = {
  eq?: InputMaybe<OrderStatus>;
  gt?: InputMaybe<OrderStatus>;
  gte?: InputMaybe<OrderStatus>;
  iLike?: InputMaybe<OrderStatus>;
  in?: InputMaybe<Array<OrderStatus>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  like?: InputMaybe<OrderStatus>;
  lt?: InputMaybe<OrderStatus>;
  lte?: InputMaybe<OrderStatus>;
  neq?: InputMaybe<OrderStatus>;
  notILike?: InputMaybe<OrderStatus>;
  notIn?: InputMaybe<Array<OrderStatus>>;
  notLike?: InputMaybe<OrderStatus>;
};

export type OrderSumAggregate = {
  __typename?: 'OrderSumAggregate';
  driverId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type PageInfo = {
  __typename?: 'PageInfo';
  /** The cursor of the last returned record. */
  endCursor?: Maybe<Scalars['ConnectionCursor']>;
  /** true if paging forward and there are more records. */
  hasNextPage?: Maybe<Scalars['Boolean']>;
  /** true if paging backwards and there are more records. */
  hasPreviousPage?: Maybe<Scalars['Boolean']>;
  /** The cursor of the first returned record. */
  startCursor?: Maybe<Scalars['ConnectionCursor']>;
};

export type PaymentGateway = {
  __typename?: 'PaymentGateway';
  enabled: Scalars['Boolean'];
  id: Scalars['ID'];
  media?: Maybe<Media>;
  mediaId?: Maybe<Scalars['Float']>;
  merchantId?: Maybe<Scalars['String']>;
  privateKey: Scalars['String'];
  publicKey?: Maybe<Scalars['String']>;
  saltKey?: Maybe<Scalars['String']>;
  title: Scalars['String'];
  type: PaymentGatewayType;
};

export type PaymentGatewayAggregateGroupBy = {
  __typename?: 'PaymentGatewayAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type PaymentGatewayAvgAggregate = {
  __typename?: 'PaymentGatewayAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type PaymentGatewayConnection = {
  __typename?: 'PaymentGatewayConnection';
  /** Array of nodes. */
  nodes: Array<PaymentGateway>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type PaymentGatewayCountAggregate = {
  __typename?: 'PaymentGatewayCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type PaymentGatewayFilter = {
  and?: InputMaybe<Array<PaymentGatewayFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<PaymentGatewayFilter>>;
};

export type PaymentGatewayMaxAggregate = {
  __typename?: 'PaymentGatewayMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type PaymentGatewayMinAggregate = {
  __typename?: 'PaymentGatewayMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type PaymentGatewaySort = {
  direction: SortDirection;
  field: PaymentGatewaySortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum PaymentGatewaySortFields {
  Id = 'id'
}

export type PaymentGatewaySumAggregate = {
  __typename?: 'PaymentGatewaySumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum PaymentGatewayType {
  AmazonPaymentServices = 'AmazonPaymentServices',
  BrainTree = 'BrainTree',
  CustomLink = 'CustomLink',
  Flutterwave = 'Flutterwave',
  Instamojo = 'Instamojo',
  Mips = 'MIPS',
  MercadoPago = 'MercadoPago',
  MyFatoorah = 'MyFatoorah',
  MyTMoney = 'MyTMoney',
  PayGate = 'PayGate',
  PayPal = 'PayPal',
  PayU = 'PayU',
  Paystack = 'Paystack',
  Paytm = 'Paytm',
  Razorpay = 'Razorpay',
  SberBank = 'SberBank',
  Stripe = 'Stripe',
  WayForPay = 'WayForPay'
}

export type Point = {
  __typename?: 'Point';
  lat: Scalars['Float'];
  lng: Scalars['Float'];
};

export type PointInput = {
  lat: Scalars['Float'];
  lng: Scalars['Float'];
};

export enum ProviderDeductTransactionType {
  Withdraw = 'Withdraw'
}

export enum ProviderRechargeTransactionType {
  Commission = 'Commission'
}

export type ProviderTransaction = {
  __typename?: 'ProviderTransaction';
  action: TransactionAction;
  amount: Scalars['Float'];
  createdAt: Scalars['DateTime'];
  currency: Scalars['String'];
  deductType?: Maybe<ProviderDeductTransactionType>;
  description?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  operatorId?: Maybe<Scalars['ID']>;
  rechargeType?: Maybe<ProviderRechargeTransactionType>;
  refrenceNumber?: Maybe<Scalars['String']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type ProviderTransactionAggregateFilter = {
  and?: InputMaybe<Array<ProviderTransactionAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  operatorId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ProviderTransactionAggregateFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type ProviderTransactionAggregateGroupBy = {
  __typename?: 'ProviderTransactionAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type ProviderTransactionAvgAggregate = {
  __typename?: 'ProviderTransactionAvgAggregate';
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type ProviderTransactionConnection = {
  __typename?: 'ProviderTransactionConnection';
  /** Array of nodes. */
  nodes: Array<ProviderTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type ProviderTransactionCountAggregate = {
  __typename?: 'ProviderTransactionCountAggregate';
  id?: Maybe<Scalars['Int']>;
  operatorId?: Maybe<Scalars['Int']>;
  requestId?: Maybe<Scalars['Int']>;
};

export type ProviderTransactionFilter = {
  and?: InputMaybe<Array<ProviderTransactionFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  operatorId?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ProviderTransactionFilter>>;
  requestId?: InputMaybe<IdFilterComparison>;
};

export type ProviderTransactionMaxAggregate = {
  __typename?: 'ProviderTransactionMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type ProviderTransactionMinAggregate = {
  __typename?: 'ProviderTransactionMinAggregate';
  id?: Maybe<Scalars['ID']>;
  operatorId?: Maybe<Scalars['ID']>;
  requestId?: Maybe<Scalars['ID']>;
};

export type ProviderTransactionSort = {
  direction: SortDirection;
  field: ProviderTransactionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ProviderTransactionSortFields {
  Id = 'id',
  OperatorId = 'operatorId',
  RequestId = 'requestId'
}

export type ProviderTransactionSumAggregate = {
  __typename?: 'ProviderTransactionSumAggregate';
  id?: Maybe<Scalars['Float']>;
  operatorId?: Maybe<Scalars['Float']>;
  requestId?: Maybe<Scalars['Float']>;
};

export type ProviderWallet = {
  __typename?: 'ProviderWallet';
  balance: Scalars['Float'];
  currency: Scalars['String'];
  id: Scalars['ID'];
};

export type ProviderWalletAggregateGroupBy = {
  __typename?: 'ProviderWalletAggregateGroupBy';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type ProviderWalletAvgAggregate = {
  __typename?: 'ProviderWalletAvgAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ProviderWalletCountAggregate = {
  __typename?: 'ProviderWalletCountAggregate';
  balance?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type ProviderWalletFilter = {
  and?: InputMaybe<Array<ProviderWalletFilter>>;
  balance?: InputMaybe<FloatFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ProviderWalletFilter>>;
};

export type ProviderWalletMaxAggregate = {
  __typename?: 'ProviderWalletMaxAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type ProviderWalletMinAggregate = {
  __typename?: 'ProviderWalletMinAggregate';
  balance?: Maybe<Scalars['Float']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type ProviderWalletSort = {
  direction: SortDirection;
  field: ProviderWalletSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ProviderWalletSortFields {
  Balance = 'balance',
  Currency = 'currency',
  Id = 'id'
}

export type ProviderWalletSumAggregate = {
  __typename?: 'ProviderWalletSumAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type Query = {
  __typename?: 'Query';
  address?: Maybe<Address>;
  addresses: AddressConnection;
  announcement?: Maybe<Announcement>;
  announcements: AnnouncementConnection;
  calculateFare: CalculateFareDto;
  carColor?: Maybe<CarColor>;
  carColors: Array<CarColor>;
  carModel?: Maybe<CarModel>;
  carModels: CarModelConnection;
  complaint?: Maybe<Complaint>;
  complaintActivities: Array<ComplaintActivity>;
  complaintActivity?: Maybe<ComplaintActivity>;
  complaintAggregate: Array<ComplaintAggregateResponse>;
  complaints: ComplaintConnection;
  coupon?: Maybe<Coupon>;
  coupons: CouponConnection;
  currentConfiguration: CurrentConfiguration;
  distressSignal?: Maybe<DistressSignal>;
  distressSignals: DistressSignalConnection;
  driver?: Maybe<Driver>;
  driverAggregate: Array<DriverAggregateResponse>;
  driverTransaction?: Maybe<DriverTransaction>;
  driverTransactions: DriverTransactionConnection;
  driverWallet?: Maybe<DriverWallet>;
  driverWallets: DriverWalletConnection;
  drivers: DriverConnection;
  export: ExportResult;
  feedback?: Maybe<Feedback>;
  feedbackParameter?: Maybe<FeedbackParameter>;
  feedbackParameters: Array<FeedbackParameter>;
  feedbacks: FeedbackConnection;
  fleet?: Maybe<Fleet>;
  fleetTransaction?: Maybe<FleetTransaction>;
  fleetTransactions: FleetTransactionConnection;
  fleetWallet?: Maybe<FleetWallet>;
  fleetWallets: FleetWalletConnection;
  fleets: FleetConnection;
  getDriversLocation: Array<OnlineDriver>;
  getDriversLocationWithData: Array<OnlineDriverWithData>;
  incomeChart: IncomeResults;
  login: TokenObject;
  me: Operator;
  operator?: Maybe<Operator>;
  operatorRole?: Maybe<OperatorRole>;
  operatorRoles: Array<OperatorRole>;
  operators: OperatorConnection;
  order?: Maybe<Order>;
  orderAggregate: Array<OrderAggregateResponse>;
  orders: OrderConnection;
  paymentGateway?: Maybe<PaymentGateway>;
  paymentGateways: PaymentGatewayConnection;
  providerTransaction?: Maybe<ProviderTransaction>;
  providerTransactions: ProviderTransactionConnection;
  providerWallet?: Maybe<ProviderWallet>;
  providerWallets: Array<ProviderWallet>;
  region?: Maybe<Region>;
  regionAggregate: Array<RegionAggregateResponse>;
  regions: RegionConnection;
  requestChart: RequestsResults;
  reward?: Maybe<Reward>;
  rewards: RewardConnection;
  rider?: Maybe<Rider>;
  riderAddress?: Maybe<RiderAddress>;
  riderAddresses: RiderAddressConnection;
  riderTransaction?: Maybe<RiderTransaction>;
  riderTransactions: RiderTransactionConnection;
  riderWallet?: Maybe<RiderWallet>;
  riderWallets: RiderWalletConnection;
  riders: RiderConnection;
  service?: Maybe<Service>;
  serviceCategories: Array<ServiceCategory>;
  serviceCategory?: Maybe<ServiceCategory>;
  serviceOption?: Maybe<ServiceOption>;
  serviceOptions: Array<ServiceOption>;
  services: Array<Service>;
  zonePrice?: Maybe<ZonePrice>;
  zonePrices: ZonePriceConnection;
};


export type QueryAddressArgs = {
  id: Scalars['ID'];
};


export type QueryAddressesArgs = {
  filter?: InputMaybe<AddressFilter>;
  paging?: InputMaybe<CursorPaging>;
  sorting?: InputMaybe<Array<AddressSort>>;
};


export type QueryAnnouncementArgs = {
  id: Scalars['ID'];
};


export type QueryAnnouncementsArgs = {
  filter?: InputMaybe<AnnouncementFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<AnnouncementSort>>;
};


export type QueryCalculateFareArgs = {
  input: CalculateFareInput;
};


export type QueryCarColorArgs = {
  id: Scalars['ID'];
};


export type QueryCarColorsArgs = {
  filter?: InputMaybe<CarColorFilter>;
  sorting?: InputMaybe<Array<CarColorSort>>;
};


export type QueryCarModelArgs = {
  id: Scalars['ID'];
};


export type QueryCarModelsArgs = {
  filter?: InputMaybe<CarModelFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<CarModelSort>>;
};


export type QueryComplaintArgs = {
  id: Scalars['ID'];
};


export type QueryComplaintActivitiesArgs = {
  filter?: InputMaybe<ComplaintActivityFilter>;
  sorting?: InputMaybe<Array<ComplaintActivitySort>>;
};


export type QueryComplaintActivityArgs = {
  id: Scalars['ID'];
};


export type QueryComplaintAggregateArgs = {
  filter?: InputMaybe<ComplaintAggregateFilter>;
};


export type QueryComplaintsArgs = {
  filter?: InputMaybe<ComplaintFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<ComplaintSort>>;
};


export type QueryCouponArgs = {
  id: Scalars['ID'];
};


export type QueryCouponsArgs = {
  filter?: InputMaybe<CouponFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<CouponSort>>;
};


export type QueryDistressSignalArgs = {
  id: Scalars['ID'];
};


export type QueryDistressSignalsArgs = {
  filter?: InputMaybe<DistressSignalFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<DistressSignalSort>>;
};


export type QueryDriverArgs = {
  id: Scalars['ID'];
};


export type QueryDriverAggregateArgs = {
  filter?: InputMaybe<DriverAggregateFilter>;
};


export type QueryDriverTransactionArgs = {
  id: Scalars['ID'];
};


export type QueryDriverTransactionsArgs = {
  filter?: InputMaybe<DriverTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<DriverTransactionSort>>;
};


export type QueryDriverWalletArgs = {
  id: Scalars['ID'];
};


export type QueryDriverWalletsArgs = {
  filter?: InputMaybe<DriverWalletFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<DriverWalletSort>>;
};


export type QueryDriversArgs = {
  filter?: InputMaybe<DriverFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<DriverSort>>;
};


export type QueryExportArgs = {
  input: ExportArgs;
};


export type QueryFeedbackArgs = {
  id: Scalars['ID'];
};


export type QueryFeedbackParameterArgs = {
  id: Scalars['ID'];
};


export type QueryFeedbackParametersArgs = {
  filter?: InputMaybe<FeedbackParameterFilter>;
  sorting?: InputMaybe<Array<FeedbackParameterSort>>;
};


export type QueryFeedbacksArgs = {
  filter?: InputMaybe<FeedbackFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FeedbackSort>>;
};


export type QueryFleetArgs = {
  id: Scalars['ID'];
};


export type QueryFleetTransactionArgs = {
  id: Scalars['ID'];
};


export type QueryFleetTransactionsArgs = {
  filter?: InputMaybe<FleetTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FleetTransactionSort>>;
};


export type QueryFleetWalletArgs = {
  id: Scalars['ID'];
};


export type QueryFleetWalletsArgs = {
  filter?: InputMaybe<FleetWalletFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FleetWalletSort>>;
};


export type QueryFleetsArgs = {
  filter?: InputMaybe<FleetFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<FleetSort>>;
};


export type QueryGetDriversLocationArgs = {
  center: PointInput;
  count: Scalars['Int'];
};


export type QueryGetDriversLocationWithDataArgs = {
  center: PointInput;
  count: Scalars['Int'];
};


export type QueryIncomeChartArgs = {
  timeframe: ChartTimeframe;
};


export type QueryLoginArgs = {
  password: Scalars['String'];
  userName: Scalars['String'];
};


export type QueryOperatorArgs = {
  id: Scalars['ID'];
};


export type QueryOperatorRoleArgs = {
  id: Scalars['ID'];
};


export type QueryOperatorRolesArgs = {
  filter?: InputMaybe<OperatorRoleFilter>;
  sorting?: InputMaybe<Array<OperatorRoleSort>>;
};


export type QueryOperatorsArgs = {
  filter?: InputMaybe<OperatorFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OperatorSort>>;
};


export type QueryOrderArgs = {
  id: Scalars['ID'];
};


export type QueryOrderAggregateArgs = {
  filter?: InputMaybe<OrderAggregateFilter>;
};


export type QueryOrdersArgs = {
  filter?: InputMaybe<OrderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OrderSort>>;
};


export type QueryPaymentGatewayArgs = {
  id: Scalars['ID'];
};


export type QueryPaymentGatewaysArgs = {
  filter?: InputMaybe<PaymentGatewayFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<PaymentGatewaySort>>;
};


export type QueryProviderTransactionArgs = {
  id: Scalars['ID'];
};


export type QueryProviderTransactionsArgs = {
  filter?: InputMaybe<ProviderTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<ProviderTransactionSort>>;
};


export type QueryProviderWalletArgs = {
  id: Scalars['ID'];
};


export type QueryProviderWalletsArgs = {
  filter?: InputMaybe<ProviderWalletFilter>;
  sorting?: InputMaybe<Array<ProviderWalletSort>>;
};


export type QueryRegionArgs = {
  id: Scalars['ID'];
};


export type QueryRegionAggregateArgs = {
  filter?: InputMaybe<RegionAggregateFilter>;
};


export type QueryRegionsArgs = {
  filter?: InputMaybe<RegionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RegionSort>>;
};


export type QueryRequestChartArgs = {
  timeframe: ChartTimeframe;
};


export type QueryRewardArgs = {
  id: Scalars['ID'];
};


export type QueryRewardsArgs = {
  filter?: InputMaybe<RewardFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RewardSort>>;
};


export type QueryRiderArgs = {
  id: Scalars['ID'];
};


export type QueryRiderAddressArgs = {
  id: Scalars['ID'];
};


export type QueryRiderAddressesArgs = {
  filter?: InputMaybe<RiderAddressFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderAddressSort>>;
};


export type QueryRiderTransactionArgs = {
  id: Scalars['ID'];
};


export type QueryRiderTransactionsArgs = {
  filter?: InputMaybe<RiderTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderTransactionSort>>;
};


export type QueryRiderWalletArgs = {
  id: Scalars['ID'];
};


export type QueryRiderWalletsArgs = {
  filter?: InputMaybe<RiderWalletFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderWalletSort>>;
};


export type QueryRidersArgs = {
  filter?: InputMaybe<RiderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderSort>>;
};


export type QueryServiceArgs = {
  id: Scalars['ID'];
};


export type QueryServiceCategoriesArgs = {
  filter?: InputMaybe<ServiceCategoryFilter>;
  sorting?: InputMaybe<Array<ServiceCategorySort>>;
};


export type QueryServiceCategoryArgs = {
  id: Scalars['ID'];
};


export type QueryServiceOptionArgs = {
  id: Scalars['ID'];
};


export type QueryServiceOptionsArgs = {
  filter?: InputMaybe<ServiceOptionFilter>;
  sorting?: InputMaybe<Array<ServiceOptionSort>>;
};


export type QueryServicesArgs = {
  filter?: InputMaybe<ServiceFilter>;
  sorting?: InputMaybe<Array<ServiceSort>>;
};


export type QueryZonePriceArgs = {
  id: Scalars['ID'];
};


export type QueryZonePricesArgs = {
  filter?: InputMaybe<ZonePriceFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<ZonePriceSort>>;
};

export type Region = {
  __typename?: 'Region';
  currency: Scalars['String'];
  enabled: Scalars['Boolean'];
  id: Scalars['ID'];
  location: Array<Array<Point>>;
  name: Scalars['String'];
};

export type RegionAggregateFilter = {
  and?: InputMaybe<Array<RegionAggregateFilter>>;
  currency?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RegionAggregateFilter>>;
};

export type RegionAggregateGroupBy = {
  __typename?: 'RegionAggregateGroupBy';
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type RegionAggregateResponse = {
  __typename?: 'RegionAggregateResponse';
  avg?: Maybe<RegionAvgAggregate>;
  count?: Maybe<RegionCountAggregate>;
  groupBy?: Maybe<RegionAggregateGroupBy>;
  max?: Maybe<RegionMaxAggregate>;
  min?: Maybe<RegionMinAggregate>;
  sum?: Maybe<RegionSumAggregate>;
};

export type RegionAvgAggregate = {
  __typename?: 'RegionAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type RegionConnection = {
  __typename?: 'RegionConnection';
  /** Array of nodes. */
  nodes: Array<Region>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RegionCountAggregate = {
  __typename?: 'RegionCountAggregate';
  currency?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type RegionDeleteResponse = {
  __typename?: 'RegionDeleteResponse';
  currency?: Maybe<Scalars['String']>;
  enabled?: Maybe<Scalars['Boolean']>;
  id?: Maybe<Scalars['ID']>;
  location?: Maybe<Array<Array<Point>>>;
  name?: Maybe<Scalars['String']>;
};

export type RegionFilter = {
  and?: InputMaybe<Array<RegionFilter>>;
  currency?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RegionFilter>>;
};

export type RegionMaxAggregate = {
  __typename?: 'RegionMaxAggregate';
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type RegionMinAggregate = {
  __typename?: 'RegionMinAggregate';
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
};

export type RegionSort = {
  direction: SortDirection;
  field: RegionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RegionSortFields {
  Currency = 'currency',
  Id = 'id'
}

export type RegionSumAggregate = {
  __typename?: 'RegionSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type RemoveActivitiesFromComplaintInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveActivitiesFromDistressSignalInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveActorFromComplaintActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveAddressesFromRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveAllowedServicesFromCouponInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveAssignedToFromComplaintActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveComplaintsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveConversationsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveCouponFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveDocumentsFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveDriverFromDriverWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveDriverFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveDriverTransactionsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveEnabledServicesFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveFeedbacksFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveFleetFromFleetWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveFleetTransactionsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveFleetsFromZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveMediaFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveMediaFromPaymentGatewayInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveMediaFromRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveMediaFromServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOperatorFromDriverTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOperatorFromFleetTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOperatorFromRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOperatorFromSosActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOptionsFromServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveOrderFromComplaintInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOrderFromDistressSignalInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveOrdersFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveOrdersFromRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveParametersFromFeedbackInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemovePaymentGatewayFromRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveProviderTransactionsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveRegionsFromServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveRiderFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveRiderFromRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveRiderFromRiderWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveRiderTransactionsFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveRoleFromOperatorInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveServiceFromOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type RemoveServicesFromServiceCategoryInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveServicesFromZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveTransactionsFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveTransactionsFromFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveTransactionsFromRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveWalletsFromDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveWalletsFromFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveWalletsFromRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RemoveZonePricesFromFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type RequestActivity = {
  __typename?: 'RequestActivity';
  createdAt: Scalars['DateTime'];
  id: Scalars['ID'];
  type: RequestActivityType;
};

export type RequestActivityAggregateFilter = {
  and?: InputMaybe<Array<RequestActivityAggregateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RequestActivityAggregateFilter>>;
};

export type RequestActivityFilter = {
  and?: InputMaybe<Array<RequestActivityFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RequestActivityFilter>>;
};

export type RequestActivitySort = {
  direction: SortDirection;
  field: RequestActivitySortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RequestActivitySortFields {
  Id = 'id'
}

export enum RequestActivityType {
  ArrivedToDestination = 'ArrivedToDestination',
  ArrivedToPickupPoint = 'ArrivedToPickupPoint',
  BookedByOperator = 'BookedByOperator',
  BookedByRider = 'BookedByRider',
  CanceledByDriver = 'CanceledByDriver',
  CanceledByOperator = 'CanceledByOperator',
  CanceledByRider = 'CanceledByRider',
  DriverAccepted = 'DriverAccepted',
  Expired = 'Expired',
  Paid = 'Paid',
  RequestedByOperator = 'RequestedByOperator',
  RequestedByRider = 'RequestedByRider',
  Reviewed = 'Reviewed',
  Started = 'Started'
}

export type RequestResultItem = {
  __typename?: 'RequestResultItem';
  count: Scalars['Float'];
  status: OrderStatus;
  time: Scalars['String'];
};

export type RequestsResults = {
  __typename?: 'RequestsResults';
  items: Array<RequestResultItem>;
};

export type Reward = {
  __typename?: 'Reward';
  appType: RewardAppType;
  beneficiary: RewardBeneficiary;
  conditionTripCountsLessThan?: Maybe<Scalars['Float']>;
  conditionUserNumberFirstDigits?: Maybe<Array<Scalars['String']>>;
  creditCurrency?: Maybe<Scalars['String']>;
  creditGift: Scalars['Float'];
  endDate?: Maybe<Scalars['DateTime']>;
  event: RewardEvent;
  id: Scalars['ID'];
  startDate?: Maybe<Scalars['DateTime']>;
  title: Scalars['String'];
  tripFeePercentGift?: Maybe<Scalars['Float']>;
};

export type RewardAggregateGroupBy = {
  __typename?: 'RewardAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export enum RewardAppType {
  Driver = 'Driver',
  Rider = 'Rider'
}

export type RewardAvgAggregate = {
  __typename?: 'RewardAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum RewardBeneficiary {
  Referrer = 'Referrer',
  Self = 'Self'
}

export type RewardConnection = {
  __typename?: 'RewardConnection';
  /** Array of nodes. */
  nodes: Array<Reward>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RewardCountAggregate = {
  __typename?: 'RewardCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type RewardDeleteResponse = {
  __typename?: 'RewardDeleteResponse';
  appType?: Maybe<RewardAppType>;
  beneficiary?: Maybe<RewardBeneficiary>;
  conditionTripCountsLessThan?: Maybe<Scalars['Float']>;
  conditionUserNumberFirstDigits?: Maybe<Array<Scalars['String']>>;
  creditCurrency?: Maybe<Scalars['String']>;
  creditGift?: Maybe<Scalars['Float']>;
  endDate?: Maybe<Scalars['DateTime']>;
  event?: Maybe<RewardEvent>;
  id?: Maybe<Scalars['ID']>;
  startDate?: Maybe<Scalars['DateTime']>;
  title?: Maybe<Scalars['String']>;
  tripFeePercentGift?: Maybe<Scalars['Float']>;
};

export enum RewardEvent {
  Register = 'Register',
  ServiceCompleted = 'ServiceCompleted'
}

export type RewardFilter = {
  and?: InputMaybe<Array<RewardFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RewardFilter>>;
};

export type RewardMaxAggregate = {
  __typename?: 'RewardMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type RewardMinAggregate = {
  __typename?: 'RewardMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type RewardSort = {
  direction: SortDirection;
  field: RewardSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RewardSortFields {
  Id = 'id'
}

export type RewardSumAggregate = {
  __typename?: 'RewardSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type Rider = {
  __typename?: 'Rider';
  addresses: RiderAddressesConnection;
  email?: Maybe<Scalars['String']>;
  firstName?: Maybe<Scalars['String']>;
  gender?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  idNumber?: Maybe<Scalars['String']>;
  isResident?: Maybe<Scalars['Boolean']>;
  lastName?: Maybe<Scalars['String']>;
  media?: Maybe<Media>;
  mobileNumber: Scalars['String'];
  orders: RiderOrdersConnection;
  registrationTimestamp: Scalars['DateTime'];
  status: RiderStatus;
  transactions: RiderTransactionsConnection;
  wallets: RiderWalletsConnection;
};


export type RiderAddressesArgs = {
  filter?: InputMaybe<RiderAddressFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderAddressSort>>;
};


export type RiderOrdersArgs = {
  filter?: InputMaybe<OrderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OrderSort>>;
};


export type RiderTransactionsArgs = {
  filter?: InputMaybe<RiderTransactionFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderTransactionSort>>;
};


export type RiderWalletsArgs = {
  filter?: InputMaybe<RiderWalletFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderWalletSort>>;
};

export type RiderAddress = {
  __typename?: 'RiderAddress';
  details?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  location: Point;
  riderId: Scalars['ID'];
  title: Scalars['String'];
  type: RiderAddressType;
};

export type RiderAddressAggregateGroupBy = {
  __typename?: 'RiderAddressAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderAddressAvgAggregate = {
  __typename?: 'RiderAddressAvgAggregate';
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type RiderAddressConnection = {
  __typename?: 'RiderAddressConnection';
  /** Array of nodes. */
  nodes: Array<RiderAddress>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderAddressCountAggregate = {
  __typename?: 'RiderAddressCountAggregate';
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
};

export type RiderAddressFilter = {
  and?: InputMaybe<Array<RiderAddressFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RiderAddressFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
};

export type RiderAddressMaxAggregate = {
  __typename?: 'RiderAddressMaxAggregate';
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderAddressMinAggregate = {
  __typename?: 'RiderAddressMinAggregate';
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderAddressSort = {
  direction: SortDirection;
  field: RiderAddressSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RiderAddressSortFields {
  Id = 'id',
  RiderId = 'riderId'
}

export type RiderAddressSumAggregate = {
  __typename?: 'RiderAddressSumAggregate';
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export enum RiderAddressType {
  Cafe = 'Cafe',
  Gym = 'Gym',
  Home = 'Home',
  Other = 'Other',
  Parent = 'Parent',
  Park = 'Park',
  Partner = 'Partner',
  Work = 'Work'
}

export type RiderAddressUpdateFilter = {
  and?: InputMaybe<Array<RiderAddressUpdateFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RiderAddressUpdateFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
};

export type RiderAddressesConnection = {
  __typename?: 'RiderAddressesConnection';
  /** Array of nodes. */
  nodes: Array<RiderAddress>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderAggregateGroupBy = {
  __typename?: 'RiderAggregateGroupBy';
  firstName?: Maybe<Scalars['String']>;
  gender?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
};

export type RiderAvgAggregate = {
  __typename?: 'RiderAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type RiderConnection = {
  __typename?: 'RiderConnection';
  /** Array of nodes. */
  nodes: Array<Rider>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderCountAggregate = {
  __typename?: 'RiderCountAggregate';
  firstName?: Maybe<Scalars['Int']>;
  gender?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  lastName?: Maybe<Scalars['Int']>;
  mobileNumber?: Maybe<Scalars['Int']>;
};

export enum RiderDeductTransactionType {
  Correction = 'Correction',
  OrderFee = 'OrderFee',
  Withdraw = 'Withdraw'
}

export type RiderFilter = {
  and?: InputMaybe<Array<RiderFilter>>;
  firstName?: InputMaybe<StringFieldComparison>;
  gender?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  lastName?: InputMaybe<StringFieldComparison>;
  mobileNumber?: InputMaybe<StringFieldComparison>;
  or?: InputMaybe<Array<RiderFilter>>;
};

export type RiderMaxAggregate = {
  __typename?: 'RiderMaxAggregate';
  firstName?: Maybe<Scalars['String']>;
  gender?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
};

export type RiderMinAggregate = {
  __typename?: 'RiderMinAggregate';
  firstName?: Maybe<Scalars['String']>;
  gender?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  lastName?: Maybe<Scalars['String']>;
  mobileNumber?: Maybe<Scalars['String']>;
};

export type RiderOrdersConnection = {
  __typename?: 'RiderOrdersConnection';
  /** Array of nodes. */
  nodes: Array<Order>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export enum RiderRechargeTransactionType {
  BankTransfer = 'BankTransfer',
  Correction = 'Correction',
  Gift = 'Gift',
  InAppPayment = 'InAppPayment'
}

export type RiderSort = {
  direction: SortDirection;
  field: RiderSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RiderSortFields {
  FirstName = 'firstName',
  Gender = 'gender',
  Id = 'id',
  LastName = 'lastName',
  MobileNumber = 'mobileNumber'
}

export enum RiderStatus {
  Disabled = 'Disabled',
  Enabled = 'Enabled'
}

export type RiderSumAggregate = {
  __typename?: 'RiderSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type RiderTransaction = {
  __typename?: 'RiderTransaction';
  action: TransactionAction;
  amount: Scalars['Float'];
  createdAt: Scalars['DateTime'];
  currency: Scalars['String'];
  deductType?: Maybe<RiderDeductTransactionType>;
  description?: Maybe<Scalars['String']>;
  id: Scalars['ID'];
  operator?: Maybe<Operator>;
  operatorId?: Maybe<Scalars['ID']>;
  paymentGateway?: Maybe<PaymentGateway>;
  paymentGatewayId?: Maybe<Scalars['ID']>;
  rechargeType?: Maybe<RiderRechargeTransactionType>;
  refrenceNumber?: Maybe<Scalars['String']>;
  requestId?: Maybe<Scalars['ID']>;
  rider: Rider;
  riderId: Scalars['ID'];
  status: TransactionStatus;
};

export type RiderTransactionAggregateFilter = {
  amount?: InputMaybe<FloatFieldComparison>;
  and?: InputMaybe<Array<RiderTransactionAggregateFilter>>;
  createdAt?: InputMaybe<DateFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RiderTransactionAggregateFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
};

export type RiderTransactionAggregateGroupBy = {
  __typename?: 'RiderTransactionAggregateGroupBy';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderTransactionAvgAggregate = {
  __typename?: 'RiderTransactionAvgAggregate';
  amount?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type RiderTransactionConnection = {
  __typename?: 'RiderTransactionConnection';
  /** Array of nodes. */
  nodes: Array<RiderTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderTransactionCountAggregate = {
  __typename?: 'RiderTransactionCountAggregate';
  amount?: Maybe<Scalars['Int']>;
  createdAt?: Maybe<Scalars['Int']>;
  currency?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
};

export type RiderTransactionFilter = {
  amount?: InputMaybe<FloatFieldComparison>;
  and?: InputMaybe<Array<RiderTransactionFilter>>;
  createdAt?: InputMaybe<DateFieldComparison>;
  currency?: InputMaybe<StringFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RiderTransactionFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
};

export type RiderTransactionInput = {
  action: TransactionAction;
  amount: Scalars['Float'];
  currency: Scalars['String'];
  deductType?: InputMaybe<RiderDeductTransactionType>;
  description?: InputMaybe<Scalars['String']>;
  rechargeType?: InputMaybe<RiderRechargeTransactionType>;
  refrenceNumber?: InputMaybe<Scalars['String']>;
  riderId: Scalars['ID'];
};

export type RiderTransactionMaxAggregate = {
  __typename?: 'RiderTransactionMaxAggregate';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderTransactionMinAggregate = {
  __typename?: 'RiderTransactionMinAggregate';
  amount?: Maybe<Scalars['Float']>;
  createdAt?: Maybe<Scalars['DateTime']>;
  currency?: Maybe<Scalars['String']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderTransactionSort = {
  direction: SortDirection;
  field: RiderTransactionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RiderTransactionSortFields {
  Amount = 'amount',
  CreatedAt = 'createdAt',
  Currency = 'currency',
  Id = 'id',
  RiderId = 'riderId'
}

export type RiderTransactionSumAggregate = {
  __typename?: 'RiderTransactionSumAggregate';
  amount?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type RiderTransactionsConnection = {
  __typename?: 'RiderTransactionsConnection';
  /** Array of nodes. */
  nodes: Array<RiderTransaction>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderWallet = {
  __typename?: 'RiderWallet';
  balance: Scalars['Float'];
  currency: Scalars['String'];
  id: Scalars['ID'];
  rider?: Maybe<Rider>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderWalletAggregateGroupBy = {
  __typename?: 'RiderWalletAggregateGroupBy';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderWalletAvgAggregate = {
  __typename?: 'RiderWalletAvgAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type RiderWalletConnection = {
  __typename?: 'RiderWalletConnection';
  /** Array of nodes. */
  nodes: Array<RiderWallet>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type RiderWalletCountAggregate = {
  __typename?: 'RiderWalletCountAggregate';
  balance?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
  riderId?: Maybe<Scalars['Int']>;
};

export type RiderWalletFilter = {
  and?: InputMaybe<Array<RiderWalletFilter>>;
  balance?: InputMaybe<FloatFieldComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<RiderWalletFilter>>;
  riderId?: InputMaybe<IdFilterComparison>;
};

export type RiderWalletMaxAggregate = {
  __typename?: 'RiderWalletMaxAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderWalletMinAggregate = {
  __typename?: 'RiderWalletMinAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['ID']>;
  riderId?: Maybe<Scalars['ID']>;
};

export type RiderWalletSort = {
  direction: SortDirection;
  field: RiderWalletSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum RiderWalletSortFields {
  Balance = 'balance',
  Id = 'id',
  RiderId = 'riderId'
}

export type RiderWalletSumAggregate = {
  __typename?: 'RiderWalletSumAggregate';
  balance?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
  riderId?: Maybe<Scalars['Float']>;
};

export type RiderWalletsConnection = {
  __typename?: 'RiderWalletsConnection';
  /** Array of nodes. */
  nodes: Array<RiderWallet>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type SosActivity = {
  __typename?: 'SOSActivity';
  action: SosActivityAction;
  createdAt: Scalars['DateTime'];
  id: Scalars['ID'];
  note?: Maybe<Scalars['String']>;
  operator: Operator;
  operatorId?: Maybe<Scalars['Float']>;
};

export enum SosActivityAction {
  ContactAuthorities = 'ContactAuthorities',
  ContactDriver = 'ContactDriver',
  MarkedAsFalseAlarm = 'MarkedAsFalseAlarm',
  MarkedAsResolved = 'MarkedAsResolved',
  Seen = 'Seen',
  Submitted = 'Submitted'
}

export type SosActivityAggregateGroupBy = {
  __typename?: 'SOSActivityAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type SosActivityAvgAggregate = {
  __typename?: 'SOSActivityAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type SosActivityCountAggregate = {
  __typename?: 'SOSActivityCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type SosActivityFilter = {
  and?: InputMaybe<Array<SosActivityFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<SosActivityFilter>>;
};

export type SosActivityMaxAggregate = {
  __typename?: 'SOSActivityMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type SosActivityMinAggregate = {
  __typename?: 'SOSActivityMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type SosActivitySort = {
  direction: SortDirection;
  field: SosActivitySortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum SosActivitySortFields {
  Id = 'id'
}

export type SosActivitySumAggregate = {
  __typename?: 'SOSActivitySumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum SosStatus {
  FalseAlarm = 'FalseAlarm',
  Resolved = 'Resolved',
  Submitted = 'Submitted',
  UnderReview = 'UnderReview'
}

export type Service = {
  __typename?: 'Service';
  baseFare: Scalars['Float'];
  cancellationDriverShare: Scalars['Float'];
  cancellationTotalFee: Scalars['Float'];
  categoryId: Scalars['ID'];
  description?: Maybe<Scalars['String']>;
  distanceMultipliers: Array<DistanceMultiplier>;
  id: Scalars['ID'];
  maximumDestinationDistance: Scalars['Int'];
  media: Media;
  mediaId: Scalars['ID'];
  minimumFee: Scalars['Float'];
  name: Scalars['String'];
  options: Array<ServiceOption>;
  paymentMethod: ServicePaymentMethod;
  perHundredMeters: Scalars['Float'];
  perMinuteDrive: Scalars['Float'];
  perMinuteWait: Scalars['Float'];
  personCapacity?: Maybe<Scalars['Int']>;
  prepayPercent: Scalars['Float'];
  providerShareFlat: Scalars['Float'];
  providerSharePercent: Scalars['Int'];
  regions: Array<Region>;
  roundingFactor?: Maybe<Scalars['Float']>;
  searchRadius: Scalars['Int'];
  timeMultipliers: Array<TimeMultiplier>;
  twoWayAvailable: Scalars['Boolean'];
};


export type ServiceOptionsArgs = {
  filter?: InputMaybe<ServiceOptionFilter>;
  sorting?: InputMaybe<Array<ServiceOptionSort>>;
};


export type ServiceRegionsArgs = {
  filter?: InputMaybe<RegionFilter>;
  sorting?: InputMaybe<Array<RegionSort>>;
};

export type ServiceAggregateFilter = {
  and?: InputMaybe<Array<ServiceAggregateFilter>>;
  categoryId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ServiceAggregateFilter>>;
};

export type ServiceAggregateGroupBy = {
  __typename?: 'ServiceAggregateGroupBy';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ServiceAvgAggregate = {
  __typename?: 'ServiceAvgAggregate';
  categoryId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ServiceCategory = {
  __typename?: 'ServiceCategory';
  id: Scalars['ID'];
  name: Scalars['String'];
  services: Array<Service>;
};


export type ServiceCategoryServicesArgs = {
  filter?: InputMaybe<ServiceFilter>;
  sorting?: InputMaybe<Array<ServiceSort>>;
};

export type ServiceCategoryAggregateGroupBy = {
  __typename?: 'ServiceCategoryAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceCategoryAvgAggregate = {
  __typename?: 'ServiceCategoryAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type ServiceCategoryCountAggregate = {
  __typename?: 'ServiceCategoryCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type ServiceCategoryDeleteResponse = {
  __typename?: 'ServiceCategoryDeleteResponse';
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
};

export type ServiceCategoryFilter = {
  and?: InputMaybe<Array<ServiceCategoryFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ServiceCategoryFilter>>;
};

export type ServiceCategoryMaxAggregate = {
  __typename?: 'ServiceCategoryMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceCategoryMinAggregate = {
  __typename?: 'ServiceCategoryMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceCategorySort = {
  direction: SortDirection;
  field: ServiceCategorySortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ServiceCategorySortFields {
  Id = 'id'
}

export type ServiceCategorySumAggregate = {
  __typename?: 'ServiceCategorySumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type ServiceCategoryWithCost = {
  __typename?: 'ServiceCategoryWithCost';
  id: Scalars['ID'];
  name: Scalars['String'];
  services: Array<ServiceWithCost>;
};

export type ServiceCountAggregate = {
  __typename?: 'ServiceCountAggregate';
  categoryId?: Maybe<Scalars['Int']>;
  id?: Maybe<Scalars['Int']>;
};

export type ServiceDeleteResponse = {
  __typename?: 'ServiceDeleteResponse';
  baseFare?: Maybe<Scalars['Float']>;
  cancellationDriverShare?: Maybe<Scalars['Float']>;
  cancellationTotalFee?: Maybe<Scalars['Float']>;
  categoryId?: Maybe<Scalars['ID']>;
  description?: Maybe<Scalars['String']>;
  distanceMultipliers?: Maybe<Array<DistanceMultiplier>>;
  id?: Maybe<Scalars['ID']>;
  maximumDestinationDistance?: Maybe<Scalars['Int']>;
  mediaId?: Maybe<Scalars['ID']>;
  minimumFee?: Maybe<Scalars['Float']>;
  name?: Maybe<Scalars['String']>;
  paymentMethod?: Maybe<ServicePaymentMethod>;
  perHundredMeters?: Maybe<Scalars['Float']>;
  perMinuteDrive?: Maybe<Scalars['Float']>;
  perMinuteWait?: Maybe<Scalars['Float']>;
  personCapacity?: Maybe<Scalars['Int']>;
  prepayPercent?: Maybe<Scalars['Float']>;
  providerShareFlat?: Maybe<Scalars['Float']>;
  providerSharePercent?: Maybe<Scalars['Int']>;
  roundingFactor?: Maybe<Scalars['Float']>;
  searchRadius?: Maybe<Scalars['Int']>;
  timeMultipliers?: Maybe<Array<TimeMultiplier>>;
  twoWayAvailable?: Maybe<Scalars['Boolean']>;
};

export type ServiceFilter = {
  and?: InputMaybe<Array<ServiceFilter>>;
  categoryId?: InputMaybe<IdFilterComparison>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ServiceFilter>>;
};

export type ServiceMaxAggregate = {
  __typename?: 'ServiceMaxAggregate';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ServiceMinAggregate = {
  __typename?: 'ServiceMinAggregate';
  categoryId?: Maybe<Scalars['ID']>;
  id?: Maybe<Scalars['ID']>;
};

export type ServiceOption = {
  __typename?: 'ServiceOption';
  additionalFee?: Maybe<Scalars['Float']>;
  icon: ServiceOptionIcon;
  id: Scalars['ID'];
  name: Scalars['String'];
  type: ServiceOptionType;
};

export type ServiceOptionAggregateGroupBy = {
  __typename?: 'ServiceOptionAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceOptionAvgAggregate = {
  __typename?: 'ServiceOptionAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type ServiceOptionCountAggregate = {
  __typename?: 'ServiceOptionCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type ServiceOptionDeleteResponse = {
  __typename?: 'ServiceOptionDeleteResponse';
  additionalFee?: Maybe<Scalars['Float']>;
  icon?: Maybe<ServiceOptionIcon>;
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
  type?: Maybe<ServiceOptionType>;
};

export type ServiceOptionFilter = {
  and?: InputMaybe<Array<ServiceOptionFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ServiceOptionFilter>>;
};

export enum ServiceOptionIcon {
  Custom1 = 'Custom1',
  Custom2 = 'Custom2',
  Custom3 = 'Custom3',
  Custom4 = 'Custom4',
  Custom5 = 'Custom5',
  Luggage = 'Luggage',
  PackageDelivery = 'PackageDelivery',
  Pet = 'Pet',
  Shopping = 'Shopping',
  TwoWay = 'TwoWay'
}

export type ServiceOptionMaxAggregate = {
  __typename?: 'ServiceOptionMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceOptionMinAggregate = {
  __typename?: 'ServiceOptionMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ServiceOptionSort = {
  direction: SortDirection;
  field: ServiceOptionSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ServiceOptionSortFields {
  Id = 'id'
}

export type ServiceOptionSumAggregate = {
  __typename?: 'ServiceOptionSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export enum ServiceOptionType {
  Free = 'Free',
  Paid = 'Paid',
  TwoWay = 'TwoWay'
}

export enum ServicePaymentMethod {
  CashCredit = 'CashCredit',
  OnlyCash = 'OnlyCash',
  OnlyCredit = 'OnlyCredit'
}

export type ServiceSort = {
  direction: SortDirection;
  field: ServiceSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ServiceSortFields {
  CategoryId = 'categoryId',
  Id = 'id'
}

export type ServiceSumAggregate = {
  __typename?: 'ServiceSumAggregate';
  categoryId?: Maybe<Scalars['Float']>;
  id?: Maybe<Scalars['Float']>;
};

export type ServiceWithCost = {
  __typename?: 'ServiceWithCost';
  cost: Scalars['Float'];
  id: Scalars['ID'];
  media: Media;
  name: Scalars['String'];
};

export type SetActivitiesOnComplaintInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetActivitiesOnDistressSignalInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetActorOnComplaintActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetAddressesOnRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetAllowedServicesOnCouponInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetAssignedToOnComplaintActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetComplaintsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetConversationsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetCouponOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetDocumentsOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetDriverOnDriverWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetDriverOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetDriverTransactionsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetEnabledServicesOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetFeedbacksOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetFleetOnFleetWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetFleetTransactionsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetFleetsOnZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetMediaOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetMediaOnPaymentGatewayInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetMediaOnRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetMediaOnServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOperatorOnDriverTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOperatorOnFleetTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOperatorOnRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOperatorOnSosActivityInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOptionsOnServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetOrderOnComplaintInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOrderOnDistressSignalInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetOrdersOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetOrdersOnRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetParametersOnFeedbackInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetPaymentGatewayOnRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetProviderTransactionsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetRegionsOnServiceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetRiderOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetRiderOnRiderTransactionInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetRiderOnRiderWalletInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetRiderTransactionsOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetRoleOnOperatorInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetServiceOnOrderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The id of relation. */
  relationId: Scalars['ID'];
};

export type SetServicesOnServiceCategoryInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetServicesOnZonePriceInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetTransactionsOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetTransactionsOnFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetTransactionsOnRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetWalletsOnDriverInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetWalletsOnFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetWalletsOnRiderInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

export type SetZonePricesOnFleetInput = {
  /** The id of the record. */
  id: Scalars['ID'];
  /** The ids of the relations. */
  relationIds: Array<Scalars['ID']>;
};

/** Sort Directions */
export enum SortDirection {
  Asc = 'ASC',
  Desc = 'DESC'
}

/** Sort Nulls Options */
export enum SortNulls {
  NullsFirst = 'NULLS_FIRST',
  NullsLast = 'NULLS_LAST'
}

export type StringFieldComparison = {
  eq?: InputMaybe<Scalars['String']>;
  gt?: InputMaybe<Scalars['String']>;
  gte?: InputMaybe<Scalars['String']>;
  iLike?: InputMaybe<Scalars['String']>;
  in?: InputMaybe<Array<Scalars['String']>>;
  is?: InputMaybe<Scalars['Boolean']>;
  isNot?: InputMaybe<Scalars['Boolean']>;
  like?: InputMaybe<Scalars['String']>;
  lt?: InputMaybe<Scalars['String']>;
  lte?: InputMaybe<Scalars['String']>;
  neq?: InputMaybe<Scalars['String']>;
  notILike?: InputMaybe<Scalars['String']>;
  notIn?: InputMaybe<Array<Scalars['String']>>;
  notLike?: InputMaybe<Scalars['String']>;
};

export type Subscription = {
  __typename?: 'Subscription';
  orderUpdated: Order;
};


export type SubscriptionOrderUpdatedArgs = {
  orderId: Scalars['ID'];
};

export type TimeMultiplier = {
  __typename?: 'TimeMultiplier';
  endTime: Scalars['String'];
  multiply: Scalars['Float'];
  startTime: Scalars['String'];
};

export type TimeMultiplierInput = {
  endTime: Scalars['String'];
  multiply: Scalars['Float'];
  startTime: Scalars['String'];
};

export type TokenObject = {
  __typename?: 'TokenObject';
  token: Scalars['String'];
};

export enum TransactionAction {
  Deduct = 'Deduct',
  Recharge = 'Recharge'
}

export enum TransactionStatus {
  Canceled = 'Canceled',
  Done = 'Done',
  Processing = 'Processing',
  Rejected = 'Rejected'
}

export type UpdateAnnouncement = {
  description?: InputMaybe<Scalars['String']>;
  expireAt?: InputMaybe<Scalars['DateTime']>;
  id?: InputMaybe<Scalars['ID']>;
  startAt?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
  url?: InputMaybe<Scalars['String']>;
  userType?: InputMaybe<Array<AnnouncementUserType>>;
};

export type UpdateCarColor = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type UpdateCarModel = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type UpdateComplaint = {
  content?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  inscriptionTimestamp?: InputMaybe<Scalars['DateTime']>;
  requestId?: InputMaybe<Scalars['ID']>;
  requestedByDriver?: InputMaybe<Scalars['Boolean']>;
  status?: InputMaybe<ComplaintStatus>;
  subject?: InputMaybe<Scalars['String']>;
};

export type UpdateConfigResult = {
  __typename?: 'UpdateConfigResult';
  message?: Maybe<Scalars['String']>;
  status: UpdateConfigStatus;
};

export enum UpdateConfigStatus {
  Invalid = 'INVALID',
  Ok = 'OK'
}

export type UpdateCoupon = {
  code?: InputMaybe<Scalars['String']>;
  creditGift?: InputMaybe<Scalars['Float']>;
  description?: InputMaybe<Scalars['String']>;
  discountFlat?: InputMaybe<Scalars['Int']>;
  discountPercent?: InputMaybe<Scalars['Int']>;
  expireAt?: InputMaybe<Scalars['DateTime']>;
  id?: InputMaybe<Scalars['ID']>;
  isEnabled?: InputMaybe<Scalars['Boolean']>;
  isFirstTravelOnly?: InputMaybe<Scalars['Boolean']>;
  manyTimesUserCanUse?: InputMaybe<Scalars['Int']>;
  manyUsersCanUse?: InputMaybe<Scalars['Int']>;
  maximumCost?: InputMaybe<Scalars['Float']>;
  minimumCost?: InputMaybe<Scalars['Float']>;
  startAt?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
};

export type UpdateDriverInput = {
  accountNumber?: InputMaybe<Scalars['String']>;
  address?: InputMaybe<Scalars['String']>;
  bankName?: InputMaybe<Scalars['String']>;
  bankRoutingNumber?: InputMaybe<Scalars['String']>;
  bankSwift?: InputMaybe<Scalars['String']>;
  carColorId?: InputMaybe<Scalars['ID']>;
  carId?: InputMaybe<Scalars['ID']>;
  carPlate?: InputMaybe<Scalars['String']>;
  carProductionYear?: InputMaybe<Scalars['Float']>;
  certificateNumber?: InputMaybe<Scalars['String']>;
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  fleetId?: InputMaybe<Scalars['ID']>;
  gender?: InputMaybe<Gender>;
  lastName?: InputMaybe<Scalars['String']>;
  mediaId?: InputMaybe<Scalars['ID']>;
  softRejectionNote?: InputMaybe<Scalars['String']>;
  status?: InputMaybe<DriverStatus>;
};

export type UpdateFeedback = {
  description?: InputMaybe<Scalars['String']>;
  driverId?: InputMaybe<Scalars['ID']>;
  id?: InputMaybe<Scalars['ID']>;
  requestId?: InputMaybe<Scalars['ID']>;
  reviewTimestamp?: InputMaybe<Scalars['DateTime']>;
  score?: InputMaybe<Scalars['Int']>;
};

export type UpdateFeedbackParameter = {
  id?: InputMaybe<Scalars['ID']>;
  isGood?: InputMaybe<Scalars['Boolean']>;
  title?: InputMaybe<Scalars['String']>;
};

export type UpdateFleet = {
  accountNumber?: InputMaybe<Scalars['String']>;
  address?: InputMaybe<Scalars['String']>;
  commissionShareFlat?: InputMaybe<Scalars['Float']>;
  commissionSharePercent?: InputMaybe<Scalars['Float']>;
  exclusivityAreas?: InputMaybe<Array<Array<PointInput>>>;
  feeMultiplier?: InputMaybe<Scalars['Float']>;
  id?: InputMaybe<Scalars['ID']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  name?: InputMaybe<Scalars['String']>;
  phoneNumber?: InputMaybe<Scalars['String']>;
};

export type UpdateManyResponse = {
  __typename?: 'UpdateManyResponse';
  /** The number of records updated. */
  updatedCount: Scalars['Int'];
};

export type UpdateManyRiderAddressesInput = {
  /** Filter used to find fields to update */
  filter: RiderAddressUpdateFilter;
  /** The update to apply to all records found using the filter */
  update: UpdateRiderAddress;
};

export type UpdateOneAnnouncementInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateAnnouncement;
};

export type UpdateOneCarColorInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateCarColor;
};

export type UpdateOneCarModelInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateCarModel;
};

export type UpdateOneComplaintInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateComplaint;
};

export type UpdateOneCouponInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateCoupon;
};

export type UpdateOneDriverInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateDriverInput;
};

export type UpdateOneFeedbackInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateFeedback;
};

export type UpdateOneFeedbackParameterInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateFeedbackParameter;
};

export type UpdateOneFleetInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateFleet;
};

export type UpdateOneOperatorInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateOperator;
};

export type UpdateOneOperatorRoleInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateOperatorRole;
};

export type UpdateOnePaymentGatewayInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdatePaymentGateway;
};

export type UpdateOneRegionInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateRegion;
};

export type UpdateOneRewardInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateReward;
};

export type UpdateOneRiderAddressInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateRiderAddress;
};

export type UpdateOneRiderInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateRider;
};

export type UpdateOneServiceCategoryInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateServiceCategory;
};

export type UpdateOneServiceInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateService;
};

export type UpdateOneServiceOptionInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateServiceOption;
};

export type UpdateOneZonePriceInput = {
  /** The id of the record to update */
  id: Scalars['ID'];
  /** The update to apply. */
  update: UpdateZonePrice;
};

export type UpdateOperator = {
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  lastName?: InputMaybe<Scalars['String']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  roleId?: InputMaybe<Scalars['ID']>;
  userName?: InputMaybe<Scalars['String']>;
};

export type UpdateOperatorRole = {
  id?: InputMaybe<Scalars['ID']>;
  permissions?: InputMaybe<Array<OperatorPermission>>;
  title?: InputMaybe<Scalars['String']>;
};

export type UpdatePasswordInput = {
  newPasswod: Scalars['String'];
  oldPassword: Scalars['String'];
};

export type UpdatePaymentGateway = {
  enabled?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['ID']>;
  mediaId?: InputMaybe<Scalars['Float']>;
  merchantId?: InputMaybe<Scalars['String']>;
  privateKey?: InputMaybe<Scalars['String']>;
  publicKey?: InputMaybe<Scalars['String']>;
  saltKey?: InputMaybe<Scalars['String']>;
  title?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<PaymentGatewayType>;
};

export type UpdatePurchaseCodeClient = {
  __typename?: 'UpdatePurchaseCodeClient';
  enabled: Scalars['Float'];
  first_verified_at: Scalars['String'];
  id: Scalars['Float'];
  ip: Scalars['String'];
  last_verified_at: Scalars['String'];
  port: Scalars['Float'];
  purchase_id: Scalars['Float'];
  token: Scalars['String'];
};

export type UpdatePurchaseCodeResult = {
  __typename?: 'UpdatePurchaseCodeResult';
  clients?: Maybe<Array<UpdatePurchaseCodeClient>>;
  status: UpdatePurchaseCodeStatus;
};

export enum UpdatePurchaseCodeStatus {
  ClientFound = 'CLIENT_FOUND',
  Invalid = 'INVALID',
  Ok = 'OK',
  Overused = 'OVERUSED'
}

export type UpdateRegion = {
  currency?: InputMaybe<Scalars['String']>;
  enabled?: InputMaybe<Scalars['Boolean']>;
  id?: InputMaybe<Scalars['ID']>;
  location?: InputMaybe<Array<Array<PointInput>>>;
  name?: InputMaybe<Scalars['String']>;
};

export type UpdateReward = {
  appType?: InputMaybe<RewardAppType>;
  beneficiary?: InputMaybe<RewardBeneficiary>;
  conditionTripCountsLessThan?: InputMaybe<Scalars['Float']>;
  conditionUserNumberFirstDigits?: InputMaybe<Array<Scalars['String']>>;
  creditCurrency?: InputMaybe<Scalars['String']>;
  creditGift?: InputMaybe<Scalars['Float']>;
  endDate?: InputMaybe<Scalars['DateTime']>;
  event?: InputMaybe<RewardEvent>;
  id?: InputMaybe<Scalars['ID']>;
  startDate?: InputMaybe<Scalars['DateTime']>;
  title?: InputMaybe<Scalars['String']>;
  tripFeePercentGift?: InputMaybe<Scalars['Float']>;
};

export type UpdateRider = {
  email?: InputMaybe<Scalars['String']>;
  firstName?: InputMaybe<Scalars['String']>;
  gender?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  idNumber?: InputMaybe<Scalars['String']>;
  isResident?: InputMaybe<Scalars['Boolean']>;
  lastName?: InputMaybe<Scalars['String']>;
  mobileNumber?: InputMaybe<Scalars['String']>;
  registrationTimestamp?: InputMaybe<Scalars['DateTime']>;
  status?: InputMaybe<RiderStatus>;
};

export type UpdateRiderAddress = {
  details?: InputMaybe<Scalars['String']>;
  id?: InputMaybe<Scalars['ID']>;
  location?: InputMaybe<PointInput>;
  riderId?: InputMaybe<Scalars['ID']>;
  title?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<RiderAddressType>;
};

export type UpdateService = {
  baseFare?: InputMaybe<Scalars['Float']>;
  cancellationDriverShare?: InputMaybe<Scalars['Float']>;
  cancellationTotalFee?: InputMaybe<Scalars['Float']>;
  categoryId?: InputMaybe<Scalars['ID']>;
  description?: InputMaybe<Scalars['String']>;
  distanceMultipliers?: InputMaybe<Array<DistanceMultiplierInput>>;
  id?: InputMaybe<Scalars['ID']>;
  maximumDestinationDistance?: InputMaybe<Scalars['Int']>;
  mediaId?: InputMaybe<Scalars['ID']>;
  minimumFee?: InputMaybe<Scalars['Float']>;
  name?: InputMaybe<Scalars['String']>;
  paymentMethod?: InputMaybe<ServicePaymentMethod>;
  perHundredMeters?: InputMaybe<Scalars['Float']>;
  perMinuteDrive?: InputMaybe<Scalars['Float']>;
  perMinuteWait?: InputMaybe<Scalars['Float']>;
  personCapacity?: InputMaybe<Scalars['Int']>;
  prepayPercent?: InputMaybe<Scalars['Float']>;
  providerShareFlat?: InputMaybe<Scalars['Float']>;
  providerSharePercent?: InputMaybe<Scalars['Int']>;
  roundingFactor?: InputMaybe<Scalars['Float']>;
  searchRadius?: InputMaybe<Scalars['Int']>;
  timeMultipliers?: InputMaybe<Array<TimeMultiplierInput>>;
  twoWayAvailable?: InputMaybe<Scalars['Boolean']>;
};

export type UpdateServiceCategory = {
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
};

export type UpdateServiceOption = {
  additionalFee?: InputMaybe<Scalars['Float']>;
  icon?: InputMaybe<ServiceOptionIcon>;
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
  type?: InputMaybe<ServiceOptionType>;
};

export type UpdateZonePrice = {
  cost?: InputMaybe<Scalars['Float']>;
  from?: InputMaybe<Array<Array<PointInput>>>;
  id?: InputMaybe<Scalars['ID']>;
  name?: InputMaybe<Scalars['String']>;
  timeMultipliers?: InputMaybe<Array<TimeMultiplierInput>>;
  to?: InputMaybe<Array<Array<PointInput>>>;
};

export type ZonePrice = {
  __typename?: 'ZonePrice';
  cost: Scalars['Float'];
  fleets: Array<Fleet>;
  from: Array<Array<Point>>;
  id: Scalars['ID'];
  name: Scalars['String'];
  services: Array<Service>;
  timeMultipliers: Array<TimeMultiplier>;
  to: Array<Array<Point>>;
};


export type ZonePriceFleetsArgs = {
  filter?: InputMaybe<FleetFilter>;
  sorting?: InputMaybe<Array<FleetSort>>;
};


export type ZonePriceServicesArgs = {
  filter?: InputMaybe<ServiceFilter>;
  sorting?: InputMaybe<Array<ServiceSort>>;
};

export type ZonePriceAggregateGroupBy = {
  __typename?: 'ZonePriceAggregateGroupBy';
  id?: Maybe<Scalars['ID']>;
};

export type ZonePriceAvgAggregate = {
  __typename?: 'ZonePriceAvgAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type ZonePriceConnection = {
  __typename?: 'ZonePriceConnection';
  /** Array of nodes. */
  nodes: Array<ZonePrice>;
  /** Paging information */
  pageInfo: OffsetPageInfo;
  /** Fetch total count of records */
  totalCount: Scalars['Int'];
};

export type ZonePriceCountAggregate = {
  __typename?: 'ZonePriceCountAggregate';
  id?: Maybe<Scalars['Int']>;
};

export type ZonePriceDeleteResponse = {
  __typename?: 'ZonePriceDeleteResponse';
  cost?: Maybe<Scalars['Float']>;
  from?: Maybe<Array<Array<Point>>>;
  id?: Maybe<Scalars['ID']>;
  name?: Maybe<Scalars['String']>;
  timeMultipliers?: Maybe<Array<TimeMultiplier>>;
  to?: Maybe<Array<Array<Point>>>;
};

export type ZonePriceFilter = {
  and?: InputMaybe<Array<ZonePriceFilter>>;
  id?: InputMaybe<IdFilterComparison>;
  or?: InputMaybe<Array<ZonePriceFilter>>;
};

export type ZonePriceMaxAggregate = {
  __typename?: 'ZonePriceMaxAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ZonePriceMinAggregate = {
  __typename?: 'ZonePriceMinAggregate';
  id?: Maybe<Scalars['ID']>;
};

export type ZonePriceSort = {
  direction: SortDirection;
  field: ZonePriceSortFields;
  nulls?: InputMaybe<SortNulls>;
};

export enum ZonePriceSortFields {
  Id = 'id'
}

export type ZonePriceSumAggregate = {
  __typename?: 'ZonePriceSumAggregate';
  id?: Maybe<Scalars['Float']>;
};

export type ViewComplaintQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewComplaintQuery = { __typename?: 'Query', complaint?: { __typename?: 'Complaint', id: string, inscriptionTimestamp: any, status: ComplaintStatus, subject: string, content?: string | null, requestedByDriver: boolean, activities: Array<{ __typename?: 'ComplaintActivity', type: ComplaintActivityType, comment?: string | null, actor: { __typename?: 'Operator', firstName?: string | null, lastName?: string | null }, assignedTo?: { __typename?: 'Operator', firstName?: string | null, lastName?: string | null } | null }>, order: { __typename?: 'Order', id: string, status: OrderStatus, createdOn: any, startTimestamp?: any | null, finishTimestamp?: any | null, expectedTimestamp?: any | null, costBest: number, costAfterCoupon: number, addresses: Array<string>, currency: string, rider?: { __typename?: 'Rider', id: string, mobileNumber: string, status: RiderStatus, firstName?: string | null, lastName?: string | null, registrationTimestamp: any } | null, driver?: { __typename?: 'Driver', id: string, mobileNumber: string, status: DriverStatus, firstName?: string | null, lastName?: string | null, registrationTimestamp: any } | null } } | null };

export type UpdateComplaintStatusMutationVariables = Exact<{
  id: Scalars['ID'];
  status: ComplaintStatus;
}>;


export type UpdateComplaintStatusMutation = { __typename?: 'Mutation', updateOneComplaint: { __typename?: 'Complaint', id: string } };

export type ComplaintsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type ComplaintsListQuery = { __typename?: 'Query', complaints: { __typename?: 'ComplaintConnection', totalCount: number, nodes: Array<{ __typename?: 'Complaint', id: string, inscriptionTimestamp: any, subject: string, status: ComplaintStatus, content?: string | null }> } };

export type CreateDriverMutationVariables = Exact<{
  input: CreateDriver;
}>;


export type CreateDriverMutation = { __typename?: 'Mutation', createOneDriver: { __typename?: 'Driver', id: string } };

export type ViewDriverQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewDriverQuery = { __typename?: 'Query', driver?: { __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, registrationTimestamp: any, lastSeenTimestamp?: any | null, status: DriverStatus, gender?: Gender | null, carId?: string | null, carColorId?: string | null, fleetId?: string | null, carProductionYear?: number | null, carPlate?: string | null, accountNumber?: string | null, bankName?: string | null, bankRoutingNumber?: string | null, bankSwift?: string | null, address?: string | null, email?: string | null, rating?: number | null, reviewCount: number, feedbacks: { __typename?: 'DriverFeedbacksConnection', nodes: Array<{ __typename?: 'Feedback', parametersAggregate: Array<{ __typename?: 'FeedbackParametersAggregateResponse', groupBy?: { __typename?: 'FeedbackParametersAggregateGroupBy', title?: string | null, isGood?: boolean | null } | null, count?: { __typename?: 'FeedbackParametersCountAggregate', id?: number | null } | null }> }> }, enabledServices: Array<{ __typename?: 'Service', id: string }>, documents: Array<{ __typename?: 'Media', id: string, address: string }>, media?: { __typename?: 'Media', address: string } | null } | null, services: Array<{ __typename?: 'Service', id: string, name: string }>, fleets: { __typename?: 'FleetConnection', nodes: Array<{ __typename?: 'Fleet', id: string, name: string }> }, carModels: { __typename?: 'CarModelConnection', nodes: Array<{ __typename?: 'CarModel', id: string, name: string }> }, carColors: Array<{ __typename?: 'CarColor', id: string, name: string }> };

export type UpdateDriverProfileMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateDriverInput;
  serviceIds: Array<Scalars['ID']> | Scalars['ID'];
}>;


export type UpdateDriverProfileMutation = { __typename?: 'Mutation', updateOneDriver: { __typename?: 'Driver', id: string }, setEnabledServicesOnDriver: { __typename?: 'Driver', id: string } };

export type UpdateDriverStatusMutationVariables = Exact<{
  id: Scalars['ID'];
  status?: InputMaybe<DriverStatus>;
}>;


export type UpdateDriverStatusMutation = { __typename?: 'Mutation', updateOneDriver: { __typename?: 'Driver', id: string } };

export type DriverFinancialsQueryVariables = Exact<{
  id: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<DriverTransactionFilter>;
  sorting?: InputMaybe<Array<DriverTransactionSort> | DriverTransactionSort>;
}>;


export type DriverFinancialsQuery = { __typename?: 'Query', driver?: { __typename?: 'Driver', transactions: { __typename?: 'DriverTransactionsConnection', totalCount: number, nodes: Array<{ __typename?: 'DriverTransaction', status: TransactionStatus, createdAt: any, amount: number, description?: string | null, currency: string, action: TransactionAction, deductType?: DriverDeductTransactionType | null, rechargeType?: DriverRechargeTransactionType | null, refrenceNumber?: string | null, requestId?: number | null, paymentGatewayId?: number | null, operatorId?: string | null }> }, wallets: Array<{ __typename?: 'DriverWallet', balance: number, currency: string }> } | null, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type DriverFeedbacksQueryVariables = Exact<{
  id: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
}>;


export type DriverFeedbacksQuery = { __typename?: 'Query', feedbacks: { __typename?: 'FeedbackConnection', nodes: Array<{ __typename?: 'Feedback', id: string, requestId: string, reviewTimestamp: any, score: number, description?: string | null, parameters: Array<{ __typename?: 'FeedbackParameter', isGood: boolean, title: string }> }> } };

export type DriverOrdersQueryVariables = Exact<{
  driverId: Scalars['ID'];
  filter?: InputMaybe<OrderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OrderSort> | OrderSort>;
}>;


export type DriverOrdersQuery = { __typename?: 'Query', driver?: { __typename?: 'Driver', orders: { __typename?: 'DriverOrdersConnection', totalCount: number, nodes: Array<{ __typename?: 'Order', id: string, createdOn: any, status: OrderStatus, distanceBest: number, durationBest: number, costBest: number, costAfterCoupon: number, currency: string, addresses: Array<string>, expectedTimestamp?: any | null, points: Array<{ __typename?: 'Point', lat: number, lng: number }> }> } } | null };

export type CreateDriverTransactionMutationVariables = Exact<{
  input: DriverTransactionInput;
}>;


export type CreateDriverTransactionMutation = { __typename?: 'Mutation', createDriverTransaction: { __typename?: 'DriverWallet', id: string } };

export type DeleteDriverMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteDriverMutation = { __typename?: 'Mutation', deleteOneDriver: { __typename?: 'Driver', id: string } };

export type DriversListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<DriverFilter>;
  sorting?: InputMaybe<Array<DriverSort> | DriverSort>;
}>;


export type DriversListQuery = { __typename?: 'Query', drivers: { __typename?: 'DriverConnection', totalCount: number, nodes: Array<{ __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, gender?: Gender | null, mobileNumber: string, status: DriverStatus, registrationTimestamp: any }> } };

export type ProviderWalletsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type ProviderWalletsListQuery = { __typename?: 'Query', providerTransactions: { __typename?: 'ProviderTransactionConnection', totalCount: number, nodes: Array<{ __typename?: 'ProviderTransaction', createdAt: any, action: TransactionAction, deductType?: ProviderDeductTransactionType | null, rechargeType?: ProviderRechargeTransactionType | null, amount: number, currency: string, description?: string | null, requestId?: string | null, operatorId?: string | null }> }, providerWallets: Array<{ __typename?: 'ProviderWallet', balance: number, currency: string }>, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type ExportQueryVariables = Exact<{
  input: ExportArgs;
}>;


export type ExportQuery = { __typename?: 'Query', export: { __typename?: 'ExportResult', url: string } };

export type DriverWalletsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type DriverWalletsListQuery = { __typename?: 'Query', driverWallets: { __typename?: 'DriverWalletConnection', totalCount: number, nodes: Array<{ __typename?: 'DriverWallet', id: string, driverId?: string | null, balance: number, currency: string, driver?: { __typename?: 'Driver', firstName?: string | null, lastName?: string | null } | null }> }, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type FleetWalletsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<FleetWalletFilter>;
}>;


export type FleetWalletsListQuery = { __typename?: 'Query', fleetWallets: { __typename?: 'FleetWalletConnection', totalCount: number, nodes: Array<{ __typename?: 'FleetWallet', id: string, balance: number, currency: string, fleetId: string, fleet: { __typename?: 'Fleet', name: string } }> }, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type RiderWalletsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type RiderWalletsListQuery = { __typename?: 'Query', riderWallets: { __typename?: 'RiderWalletConnection', totalCount: number, nodes: Array<{ __typename?: 'RiderWallet', balance: number, currency: string, riderId?: string | null, rider?: { __typename?: 'Rider', firstName?: string | null, lastName?: string | null } | null }> }, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type DispatcherCalculateFareQueryVariables = Exact<{
  points: Array<PointInput> | PointInput;
}>;


export type DispatcherCalculateFareQuery = { __typename?: 'Query', calculateFare: { __typename?: 'CalculateFareDTO', currency: string, distance: number, duration: number, services: Array<{ __typename?: 'ServiceCategoryWithCost', name: string, services: Array<{ __typename?: 'ServiceWithCost', id: string, name: string, cost: number }> }> } };

export type CreateOrderMutationVariables = Exact<{
  riderId: Scalars['ID'];
  points: Array<PointInput> | PointInput;
  addresses: Array<Scalars['String']> | Scalars['String'];
  serviceId: Scalars['ID'];
}>;


export type CreateOrderMutation = { __typename?: 'Mutation', createOrder: { __typename?: 'Order', id: string } };

export type OrderUpdatedSubscriptionVariables = Exact<{
  id: Scalars['ID'];
}>;


export type OrderUpdatedSubscription = { __typename?: 'Subscription', orderUpdated: { __typename?: 'Order', id: string, status: OrderStatus, driver?: { __typename?: 'Driver', firstName?: string | null, lastName?: string | null, mobileNumber: string } | null } };

export type CancelOrderMutationVariables = Exact<{
  orderId: Scalars['ID'];
}>;


export type CancelOrderMutation = { __typename?: 'Mutation', cancelOrder: { __typename?: 'Order', id: string, status: OrderStatus } };

export type DriverOverviewInfoFragment = { __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, status: DriverStatus };

export type DriverLocationFragment = { __typename?: 'OnlineDriver', driverId: number, lastUpdatedAt: number, location: { __typename?: 'Point', lat: number, lng: number } };

export type OverviewQueryVariables = Exact<{ [key: string]: never; }>;


export type OverviewQuery = { __typename?: 'Query', complaintAggregate: Array<{ __typename?: 'ComplaintAggregateResponse', count?: { __typename?: 'ComplaintCountAggregate', id?: number | null } | null }>, driverAggregate: Array<{ __typename?: 'DriverAggregateResponse', count?: { __typename?: 'DriverCountAggregate', id?: number | null } | null }>, activeOrders: Array<{ __typename?: 'OrderAggregateResponse', count?: { __typename?: 'OrderCountAggregate', id?: number | null } | null }>, bookedOrders: Array<{ __typename?: 'OrderAggregateResponse', count?: { __typename?: 'OrderCountAggregate', id?: number | null } | null }>, getDriversLocation: Array<{ __typename?: 'OnlineDriver', driverId: number, lastUpdatedAt: number, location: { __typename?: 'Point', lat: number, lng: number } }>, drivers: { __typename?: 'DriverConnection', totalCount: number, nodes: Array<{ __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, status: DriverStatus }> } };

export type OverviewDriverPagingQueryVariables = Exact<{
  offset: Scalars['Int'];
}>;


export type OverviewDriverPagingQuery = { __typename?: 'Query', drivers: { __typename?: 'DriverConnection', totalCount: number, nodes: Array<{ __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, status: DriverStatus }> } };

export type RequestsChartQueryVariables = Exact<{
  timeframe: ChartTimeframe;
}>;


export type RequestsChartQuery = { __typename?: 'Query', requestChart: { __typename?: 'RequestsResults', items: Array<{ __typename?: 'RequestResultItem', time: string, count: number, status: OrderStatus }> } };

export type IncomeChartQueryVariables = Exact<{
  timeframe: ChartTimeframe;
}>;


export type IncomeChartQuery = { __typename?: 'Query', incomeChart: { __typename?: 'IncomeResults', items: Array<{ __typename?: 'IncomeResultItem', time: string, sum: number, currency: string }> } };

export type CarsListQueryVariables = Exact<{ [key: string]: never; }>;


export type CarsListQuery = { __typename?: 'Query', carModels: { __typename?: 'CarModelConnection', nodes: Array<{ __typename?: 'CarModel', id: string, name: string }> }, carColors: Array<{ __typename?: 'CarColor', id: string, name: string }> };

export type DeleteCarModelMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteCarModelMutation = { __typename?: 'Mutation', deleteOneCarModel: { __typename?: 'CarModelDeleteResponse', id?: string | null } };

export type DeleteCarColorMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteCarColorMutation = { __typename?: 'Mutation', deleteOneCarColor: { __typename?: 'CarColorDeleteResponse', id?: string | null } };

export type CreateCarModelMutationVariables = Exact<{
  input: CreateCarModel;
}>;


export type CreateCarModelMutation = { __typename?: 'Mutation', createOneCarModel: { __typename?: 'CarModel', id: string } };

export type CreateCarColorMutationVariables = Exact<{
  input: CreateCarColor;
}>;


export type CreateCarColorMutation = { __typename?: 'Mutation', createOneCarColor: { __typename?: 'CarColor', id: string } };

export type UpdateCarModelMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateCarModel;
}>;


export type UpdateCarModelMutation = { __typename?: 'Mutation', updateOneCarModel: { __typename?: 'CarModel', id: string } };

export type UpdateCarColorMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateCarColor;
}>;


export type UpdateCarColorMutation = { __typename?: 'Mutation', updateOneCarColor: { __typename?: 'CarColor', id: string } };

export type CreateFleetMutationVariables = Exact<{
  input: CreateFleet;
}>;


export type CreateFleetMutation = { __typename?: 'Mutation', createOneFleet: { __typename?: 'Fleet', id: string } };

export type ViewFleetQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewFleetQuery = { __typename?: 'Query', fleet?: { __typename?: 'Fleet', id: string, name: string, phoneNumber: string, address?: string | null, mobileNumber: string, accountNumber: string, commissionSharePercent: number, commissionShareFlat: number, feeMultiplier?: number | null, exclusivityAreas?: Array<Array<{ __typename?: 'Point', lat: number, lng: number }>> | null } | null };

export type FleetFinancialsQueryVariables = Exact<{
  id: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<FleetTransactionFilter>;
  sorting?: InputMaybe<Array<FleetTransactionSort> | FleetTransactionSort>;
}>;


export type FleetFinancialsQuery = { __typename?: 'Query', fleet?: { __typename?: 'Fleet', transactions: { __typename?: 'FleetTransactionsConnection', totalCount: number, nodes: Array<{ __typename?: 'FleetTransaction', transactionTimestamp: any, amount: number, currency: string, action: TransactionAction, deductType?: ProviderDeductTransactionType | null, rechargeType?: ProviderRechargeTransactionType | null, refrenceNumber?: string | null, operatorId?: string | null, requestId?: string | null, description?: string | null }> }, wallets: Array<{ __typename?: 'FleetWallet', currency: string, balance: number }> } | null, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type FleetZonePricesQueryVariables = Exact<{
  id: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<ZonePriceFilter>;
  sorting?: InputMaybe<Array<ZonePriceSort> | ZonePriceSort>;
}>;


export type FleetZonePricesQuery = { __typename?: 'Query', fleet?: { __typename?: 'Fleet', zonePrices: { __typename?: 'FleetZonePricesConnection', totalCount: number, nodes: Array<{ __typename?: 'ZonePrice', id: string, name: string }> } } | null };

export type FleetDriversQueryVariables = Exact<{
  id: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
}>;


export type FleetDriversQuery = { __typename?: 'Query', drivers: { __typename?: 'DriverConnection', nodes: Array<{ __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string }> } };

export type UpdateFleetMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateFleet;
}>;


export type UpdateFleetMutation = { __typename?: 'Mutation', updateOneFleet: { __typename?: 'Fleet', id: string } };

export type CreateFleetTransactionMutationVariables = Exact<{
  input: FleetTransactionInput;
}>;


export type CreateFleetTransactionMutation = { __typename?: 'Mutation', createFleetTransaction: { __typename?: 'FleetWallet', id: string } };

export type FleetsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<FleetFilter>;
}>;


export type FleetsListQuery = { __typename?: 'Query', fleets: { __typename?: 'FleetConnection', totalCount: number, nodes: Array<{ __typename?: 'Fleet', id: string, name: string, phoneNumber: string, address?: string | null }> } };

export type ViewPaymentGatewayQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewPaymentGatewayQuery = { __typename?: 'Query', paymentGateway?: { __typename?: 'PaymentGateway', id: string, title: string, type: PaymentGatewayType, enabled: boolean, privateKey: string, publicKey?: string | null, merchantId?: string | null, saltKey?: string | null, mediaId?: number | null, media?: { __typename?: 'Media', address: string } | null } | null };

export type CreatePaymentGatewayMutationVariables = Exact<{
  input: CreatePaymentGateway;
}>;


export type CreatePaymentGatewayMutation = { __typename?: 'Mutation', createOnePaymentGateway: { __typename?: 'PaymentGateway', id: string } };

export type UpdatePaymentGatewayMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdatePaymentGateway;
}>;


export type UpdatePaymentGatewayMutation = { __typename?: 'Mutation', updateOnePaymentGateway: { __typename?: 'PaymentGateway', id: string } };

export type PaymentGatewaysQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type PaymentGatewaysQuery = { __typename?: 'Query', paymentGateways: { __typename?: 'PaymentGatewayConnection', totalCount: number, nodes: Array<{ __typename?: 'PaymentGateway', id: string, enabled: boolean, title: string, type: PaymentGatewayType, media?: { __typename?: 'Media', address: string } | null }> } };

export type RegionListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type RegionListQuery = { __typename?: 'Query', regions: { __typename?: 'RegionConnection', totalCount: number, nodes: Array<{ __typename?: 'Region', id: string, name: string, currency: string, enabled: boolean, location: Array<Array<{ __typename?: 'Point', lat: number, lng: number }>> }> } };

export type RegionViewQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type RegionViewQuery = { __typename?: 'Query', region?: { __typename?: 'Region', id: string, name: string, currency: string, enabled: boolean, location: Array<Array<{ __typename?: 'Point', lat: number, lng: number }>> } | null };

export type UpdateRegionMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateRegion;
}>;


export type UpdateRegionMutation = { __typename?: 'Mutation', updateOneRegion: { __typename?: 'Region', id: string } };

export type CreateRegionMutationVariables = Exact<{
  input: CreateRegion;
}>;


export type CreateRegionMutation = { __typename?: 'Mutation', createOneRegion: { __typename?: 'Region', id: string } };

export type ReviewParameterViewQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ReviewParameterViewQuery = { __typename?: 'Query', feedbackParameter?: { __typename?: 'FeedbackParameter', id: string, title: string, isGood: boolean } | null };

export type UpdateReviewParameterMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateFeedbackParameter;
}>;


export type UpdateReviewParameterMutation = { __typename?: 'Mutation', updateOneFeedbackParameter: { __typename?: 'FeedbackParameter', id: string } };

export type CreateReviewParameterMutationVariables = Exact<{
  input: CreateFeedbackParameter;
}>;


export type CreateReviewParameterMutation = { __typename?: 'Mutation', createOneFeedbackParameter: { __typename?: 'FeedbackParameter', id: string } };

export type ReviewParametersListQueryVariables = Exact<{ [key: string]: never; }>;


export type ReviewParametersListQuery = { __typename?: 'Query', feedbackParameters: Array<{ __typename?: 'FeedbackParameter', id: string, title: string, isGood: boolean }> };

export type RolesQueryVariables = Exact<{ [key: string]: never; }>;


export type RolesQuery = { __typename?: 'Query', operatorRoles: Array<{ __typename?: 'OperatorRole', id: string, title: string }> };

export type RoleQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type RoleQuery = { __typename?: 'Query', operatorRole?: { __typename?: 'OperatorRole', id: string, title: string, permissions: Array<OperatorPermission> } | null };

export type CreateRoleMutationVariables = Exact<{
  input: CreateOperatorRole;
}>;


export type CreateRoleMutation = { __typename?: 'Mutation', createOneOperatorRole: { __typename?: 'OperatorRole', id: string, title: string, permissions: Array<OperatorPermission> } };

export type UpdateRoleMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateOperatorRole;
}>;


export type UpdateRoleMutation = { __typename?: 'Mutation', updateOneOperatorRole: { __typename?: 'OperatorRole', id: string } };

export type ServiceOptionViewQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ServiceOptionViewQuery = { __typename?: 'Query', serviceOption?: { __typename?: 'ServiceOption', id: string, name: string, type: ServiceOptionType, icon: ServiceOptionIcon, additionalFee?: number | null } | null };

export type UpdateServiceOptionMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateServiceOption;
}>;


export type UpdateServiceOptionMutation = { __typename?: 'Mutation', updateOneServiceOption: { __typename?: 'ServiceOption', id: string } };

export type CreateServiceOptionMutationVariables = Exact<{
  input: CreateServiceOption;
}>;


export type CreateServiceOptionMutation = { __typename?: 'Mutation', createOneServiceOption: { __typename?: 'ServiceOption', id: string } };

export type ServiceOptionsListQueryVariables = Exact<{ [key: string]: never; }>;


export type ServiceOptionsListQuery = { __typename?: 'Query', serviceOptions: Array<{ __typename?: 'ServiceOption', id: string, name: string, icon: ServiceOptionIcon, type: ServiceOptionType, additionalFee?: number | null }> };

export type ViewServiceCategoryQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewServiceCategoryQuery = { __typename?: 'Query', serviceCategory?: { __typename?: 'ServiceCategory', id: string, name: string } | null };

export type CreateServiceCategoryMutationVariables = Exact<{
  input: CreateServiceCategory;
}>;


export type CreateServiceCategoryMutation = { __typename?: 'Mutation', createOneServiceCategory: { __typename?: 'ServiceCategory', id: string } };

export type UpdateServiceCategoryMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateServiceCategory;
}>;


export type UpdateServiceCategoryMutation = { __typename?: 'Mutation', updateOneServiceCategory: { __typename?: 'ServiceCategory', id: string } };

export type DeleteServiceCategoryMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteServiceCategoryMutation = { __typename?: 'Mutation', deleteOneServiceCategory: { __typename?: 'ServiceCategoryDeleteResponse', id?: string | null } };

export type ServicesListQueryVariables = Exact<{ [key: string]: never; }>;


export type ServicesListQuery = { __typename?: 'Query', serviceCategories: Array<{ __typename?: 'ServiceCategory', id: string, name: string, services: Array<{ __typename?: 'Service', id: string, name: string, description?: string | null, media: { __typename?: 'Media', address: string } }> }> };

export type ViewServiceQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewServiceQuery = { __typename?: 'Query', service?: { __typename?: 'Service', id: string, name: string, categoryId: string, baseFare: number, perHundredMeters: number, perMinuteDrive: number, perMinuteWait: number, minimumFee: number, searchRadius: number, maximumDestinationDistance: number, paymentMethod: ServicePaymentMethod, cancellationTotalFee: number, cancellationDriverShare: number, providerShareFlat: number, providerSharePercent: number, prepayPercent: number, mediaId: string, description?: string | null, personCapacity?: number | null, roundingFactor?: number | null, media: { __typename?: 'Media', address: string }, timeMultipliers: Array<{ __typename?: 'TimeMultiplier', startTime: string, endTime: string, multiply: number }>, distanceMultipliers: Array<{ __typename?: 'DistanceMultiplier', distanceFrom: number, distanceTo: number, multiply: number }>, options: Array<{ __typename?: 'ServiceOption', id: string, name: string, type: ServiceOptionType, additionalFee?: number | null, icon: ServiceOptionIcon }>, regions: Array<{ __typename?: 'Region', id: string, name: string, currency: string }> } | null, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', id: string, name: string, currency: string }> }, serviceCategories: Array<{ __typename?: 'ServiceCategory', id: string, name: string }>, serviceOptions: Array<{ __typename?: 'ServiceOption', id: string, name: string, icon: ServiceOptionIcon, type: ServiceOptionType, additionalFee?: number | null }> };

export type NewServiceQueryVariables = Exact<{ [key: string]: never; }>;


export type NewServiceQuery = { __typename?: 'Query', regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', id: string, name: string, currency: string }> }, serviceCategories: Array<{ __typename?: 'ServiceCategory', id: string, name: string }>, serviceOptions: Array<{ __typename?: 'ServiceOption', id: string, name: string, icon: ServiceOptionIcon, type: ServiceOptionType, additionalFee?: number | null }> };

export type CreateServiceMutationVariables = Exact<{
  input: CreateService;
}>;


export type CreateServiceMutation = { __typename?: 'Mutation', createOneService: { __typename?: 'Service', id: string } };

export type DeleteServiceMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteServiceMutation = { __typename?: 'Mutation', deleteOneService: { __typename?: 'ServiceDeleteResponse', id?: string | null } };

export type UpdateServiceMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateService;
}>;


export type UpdateServiceMutation = { __typename?: 'Mutation', updateOneService: { __typename?: 'Service', id: string } };

export type SetRegionsOnServiceMutationVariables = Exact<{
  id: Scalars['ID'];
  relationIds: Array<Scalars['ID']> | Scalars['ID'];
}>;


export type SetRegionsOnServiceMutation = { __typename?: 'Mutation', setRegionsOnService: { __typename?: 'Service', id: string } };

export type SetOptionsOnServiceMutationVariables = Exact<{
  id: Scalars['ID'];
  relationIds: Array<Scalars['ID']> | Scalars['ID'];
}>;


export type SetOptionsOnServiceMutation = { __typename?: 'Mutation', setOptionsOnService: { __typename?: 'Service', id: string } };

export type UpdatePasswordMutationVariables = Exact<{
  input: UpdatePasswordInput;
}>;


export type UpdatePasswordMutation = { __typename?: 'Mutation', updatePassword: { __typename?: 'Operator', id: string } };

export type CreateOperatorMutationVariables = Exact<{
  input: CreateOperatorInput;
}>;


export type CreateOperatorMutation = { __typename?: 'Mutation', createOneOperator: { __typename?: 'Operator', id: string } };

export type ViewOperatorQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewOperatorQuery = { __typename?: 'Query', operator?: { __typename?: 'Operator', id: string, firstName?: string | null, lastName?: string | null, mobileNumber?: string | null, userName: string, email?: string | null, roleId?: string | null } | null, operatorRoles: Array<{ __typename?: 'OperatorRole', id: string, title: string }> };

export type NewOperatorQueryVariables = Exact<{ [key: string]: never; }>;


export type NewOperatorQuery = { __typename?: 'Query', operatorRoles: Array<{ __typename?: 'OperatorRole', id: string, title: string }> };

export type UpdateOperatorMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateOperator;
}>;


export type UpdateOperatorMutation = { __typename?: 'Mutation', updateOneOperator: { __typename?: 'Operator', id: string } };

export type UsersListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type UsersListQuery = { __typename?: 'Query', operators: { __typename?: 'OperatorConnection', totalCount: number, nodes: Array<{ __typename?: 'Operator', id: string, userName: string, firstName?: string | null, lastName?: string | null, role?: { __typename?: 'OperatorRole', title: string } | null }> } };

export type ZonePriceViewQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ZonePriceViewQuery = { __typename?: 'Query', zonePrice?: { __typename?: 'ZonePrice', id: string, name: string, cost: number, from: Array<Array<{ __typename?: 'Point', lat: number, lng: number }>>, to: Array<Array<{ __typename?: 'Point', lat: number, lng: number }>>, services: Array<{ __typename?: 'Service', id: string }>, fleets: Array<{ __typename?: 'Fleet', id: string }>, timeMultipliers: Array<{ __typename?: 'TimeMultiplier', startTime: string, endTime: string, multiply: number }> } | null, fleets: { __typename?: 'FleetConnection', nodes: Array<{ __typename?: 'Fleet', id: string, name: string }> }, services: Array<{ __typename?: 'Service', id: string, name: string }> };

export type ZonePriceNewQueryVariables = Exact<{ [key: string]: never; }>;


export type ZonePriceNewQuery = { __typename?: 'Query', fleets: { __typename?: 'FleetConnection', nodes: Array<{ __typename?: 'Fleet', id: string, name: string }> }, services: Array<{ __typename?: 'Service', id: string, name: string }> };

export type UpdateZonePriceMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateZonePrice;
}>;


export type UpdateZonePriceMutation = { __typename?: 'Mutation', updateOneZonePrice: { __typename?: 'ZonePrice', id: string } };

export type CreateZonePriceMutationVariables = Exact<{
  input: CreateZonePrice;
}>;


export type CreateZonePriceMutation = { __typename?: 'Mutation', createOneZonePrice: { __typename?: 'ZonePrice', id: string } };

export type SetZonePriceRelationsMutationVariables = Exact<{
  id: Scalars['ID'];
  services: Array<Scalars['ID']> | Scalars['ID'];
  fleets: Array<Scalars['ID']> | Scalars['ID'];
}>;


export type SetZonePriceRelationsMutation = { __typename?: 'Mutation', setServicesOnZonePrice: { __typename?: 'ZonePrice', id: string }, setFleetsOnZonePrice: { __typename?: 'ZonePrice', id: string } };

export type ZonePricesListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type ZonePricesListQuery = { __typename?: 'Query', zonePrices: { __typename?: 'ZonePriceConnection', totalCount: number, nodes: Array<{ __typename?: 'ZonePrice', id: string, name: string }> } };

export type ViewAnnouncementQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewAnnouncementQuery = { __typename?: 'Query', announcement?: { __typename?: 'Announcement', id: string, title: string, userType: Array<AnnouncementUserType>, description: string, url?: string | null, startAt: any, expireAt: any } | null };

export type CreateAnnouncementMutationVariables = Exact<{
  input: CreateAnnouncement;
}>;


export type CreateAnnouncementMutation = { __typename?: 'Mutation', createOneAnnouncement: { __typename?: 'Announcement', id: string } };

export type UpdateAnnouncementMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateAnnouncement;
}>;


export type UpdateAnnouncementMutation = { __typename?: 'Mutation', updateOneAnnouncement: { __typename?: 'Announcement', id: string } };

export type AnnouncementsListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type AnnouncementsListQuery = { __typename?: 'Query', announcements: { __typename?: 'AnnouncementConnection', totalCount: number, nodes: Array<{ __typename?: 'Announcement', id: string, title: string, description: string, startAt: any, expireAt: any }> } };

export type ViewCouponQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewCouponQuery = { __typename?: 'Query', coupon?: { __typename?: 'Coupon', id: string, isEnabled: boolean, code: string, title: string, description: string, manyUsersCanUse: number, manyTimesUserCanUse: number, minimumCost: number, maximumCost: number, startAt: any, expireAt: any, discountPercent: number, discountFlat: number, creditGift: number, isFirstTravelOnly: boolean, allowedServices: Array<{ __typename?: 'Service', id: string, name: string }> } | null };

export type CreateCouponMutationVariables = Exact<{
  input: CreateCoupon;
}>;


export type CreateCouponMutation = { __typename?: 'Mutation', createOneCoupon: { __typename?: 'Coupon', id: string } };

export type UpdateCouponMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateCoupon;
}>;


export type UpdateCouponMutation = { __typename?: 'Mutation', updateOneCoupon: { __typename?: 'Coupon', id: string } };

export type CouponListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type CouponListQuery = { __typename?: 'Query', coupons: { __typename?: 'CouponConnection', totalCount: number, nodes: Array<{ __typename?: 'Coupon', id: string, code: string, title: string, isEnabled: boolean, description: string, startAt: any, expireAt: any }> } };

export type RewardListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type RewardListQuery = { __typename?: 'Query', rewards: { __typename?: 'RewardConnection', totalCount: number, nodes: Array<{ __typename?: 'Reward', id: string, title: string, startDate?: any | null, endDate?: any | null, beneficiary: RewardBeneficiary, event: RewardEvent }> } };

export type ViewRewardQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewRewardQuery = { __typename?: 'Query', reward?: { __typename?: 'Reward', id: string, title: string, startDate?: any | null, endDate?: any | null, appType: RewardAppType, beneficiary: RewardBeneficiary, event: RewardEvent, creditGift: number, tripFeePercentGift?: number | null, creditCurrency?: string | null, conditionTripCountsLessThan?: number | null, conditionUserNumberFirstDigits?: Array<string> | null } | null };

export type CreateRewardMutationVariables = Exact<{
  input: CreateReward;
}>;


export type CreateRewardMutation = { __typename?: 'Mutation', createOneReward: { __typename?: 'Reward', id: string } };

export type UpdateRewardMutationVariables = Exact<{
  id: Scalars['ID'];
  input: UpdateReward;
}>;


export type UpdateRewardMutation = { __typename?: 'Mutation', updateOneReward: { __typename?: 'Reward', id: string } };

export type AvailableDriversForOrderQueryVariables = Exact<{
  center: PointInput;
  count: Scalars['Int'];
}>;


export type AvailableDriversForOrderQuery = { __typename?: 'Query', getDriversLocationWithData: Array<{ __typename?: 'OnlineDriverWithData', id: number, mobileNumber: string, firstName?: string | null, lastName?: string | null, lastUpdatedAt: number, rating?: number | null, reviewCount: number, status: DriverStatus, location: { __typename?: 'Point', lat: number, lng: number } }> };

export type DriverSearchQueryVariables = Exact<{
  filter: Scalars['String'];
}>;


export type DriverSearchQuery = { __typename?: 'Query', drivers: { __typename?: 'DriverConnection', nodes: Array<{ __typename?: 'Driver', id: string, mobileNumber: string, firstName?: string | null, lastName?: string | null, rating?: number | null, reviewCount: number, status: DriverStatus }> } };

export type AssignDriverToOrderMutationVariables = Exact<{
  orderId: Scalars['ID'];
  driverId: Scalars['ID'];
}>;


export type AssignDriverToOrderMutation = { __typename?: 'Mutation', assignDriverToOrder: { __typename?: 'Order', id: string } };

export type ViewOrderQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewOrderQuery = { __typename?: 'Query', order?: { __typename?: 'Order', id: string, createdOn: any, costBest: number, costAfterCoupon: number, status: OrderStatus, currency: string, distanceBest: number, durationBest: number, startTimestamp?: any | null, finishTimestamp?: any | null, addresses: Array<string>, points: Array<{ __typename?: 'Point', lat: number, lng: number }>, service?: { __typename?: 'Service', name: string } | null, driver?: { __typename?: 'Driver', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, registrationTimestamp: any, status: DriverStatus, media?: { __typename?: 'Media', address: string } | null } | null, rider?: { __typename?: 'Rider', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, registrationTimestamp: any, status: RiderStatus, media?: { __typename?: 'Media', address: string } | null } | null, complaints: Array<{ __typename?: 'Complaint', id: string, subject: string, inscriptionTimestamp: any, content?: string | null, requestedByDriver: boolean }>, conversations: Array<{ __typename?: 'OrderMessage', sentAt: any, sentByDriver: boolean, status: MessageStatus, content: string }>, activities: Array<{ __typename?: 'RequestActivity', createdAt: any, type: RequestActivityType }>, coupon?: { __typename?: 'Coupon', title: string, code: string, expireAt: any } | null, riderTransactions: Array<{ __typename?: 'RiderTransaction', action: TransactionAction, rechargeType?: RiderRechargeTransactionType | null, deductType?: RiderDeductTransactionType | null, amount: number, status: TransactionStatus, currency: string, refrenceNumber?: string | null, paymentGateway?: { __typename?: 'PaymentGateway', title: string } | null }>, driverTransactions: Array<{ __typename?: 'DriverTransaction', action: TransactionAction, rechargeType?: DriverRechargeTransactionType | null, deductType?: DriverDeductTransactionType | null, amount: number, status: TransactionStatus, currency: string, refrenceNumber?: string | null }>, providerTransactions: Array<{ __typename?: 'ProviderTransaction', action: TransactionAction, rechargeType?: ProviderRechargeTransactionType | null, deductType?: ProviderDeductTransactionType | null, amount: number, currency: string, refrenceNumber?: string | null }>, fleetTransactions: Array<{ __typename?: 'FleetTransaction', action: TransactionAction, rechargeType?: ProviderRechargeTransactionType | null, deductType?: ProviderDeductTransactionType | null, amount: number, currency: string, refrenceNumber?: string | null }> } | null };

export type OrdersListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<OrderFilter>;
  sorting?: InputMaybe<Array<OrderSort> | OrderSort>;
}>;


export type OrdersListQuery = { __typename?: 'Query', orders: { __typename?: 'OrderConnection', totalCount: number, nodes: Array<{ __typename?: 'Order', id: string, status: OrderStatus, createdOn: any, costAfterCoupon: number, currency: string }> } };

export type CreateRiderMutationVariables = Exact<{
  input: CreateRider;
}>;


export type CreateRiderMutation = { __typename?: 'Mutation', createOneRider: { __typename?: 'Rider', id: string, firstName?: string | null, lastName?: string | null, mobileNumber: string, gender?: string | null } };

export type ViewRiderQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewRiderQuery = { __typename?: 'Query', rider?: { __typename?: 'Rider', id: string, status: RiderStatus, firstName?: string | null, lastName?: string | null, mobileNumber: string, isResident?: boolean | null, idNumber?: string | null, registrationTimestamp: any, email?: string | null, gender?: string | null, media?: { __typename?: 'Media', address: string } | null, wallets: { __typename?: 'RiderWalletsConnection', nodes: Array<{ __typename?: 'RiderWallet', balance: number, currency: string }> } } | null };

export type RiderAddressesQueryVariables = Exact<{
  riderId: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
}>;


export type RiderAddressesQuery = { __typename?: 'Query', riderAddresses: { __typename?: 'RiderAddressConnection', nodes: Array<{ __typename?: 'RiderAddress', title: string, details?: string | null, location: { __typename?: 'Point', lat: number, lng: number } }> } };

export type RiderWalletQueryVariables = Exact<{
  riderId: Scalars['ID'];
  paging?: InputMaybe<OffsetPaging>;
  filter?: InputMaybe<RiderTransactionFilter>;
  sorting?: InputMaybe<Array<RiderTransactionSort> | RiderTransactionSort>;
}>;


export type RiderWalletQuery = { __typename?: 'Query', rider?: { __typename?: 'Rider', wallets: { __typename?: 'RiderWalletsConnection', nodes: Array<{ __typename?: 'RiderWallet', balance: number, currency: string }> }, transactions: { __typename?: 'RiderTransactionsConnection', totalCount: number, nodes: Array<{ __typename?: 'RiderTransaction', action: TransactionAction, deductType?: RiderDeductTransactionType | null, status: TransactionStatus, createdAt: any, rechargeType?: RiderRechargeTransactionType | null, amount: number, currency: string, refrenceNumber?: string | null, description?: string | null, paymentGatewayId?: string | null, operatorId?: string | null, requestId?: string | null }> } } | null, regions: { __typename?: 'RegionConnection', nodes: Array<{ __typename?: 'Region', currency: string }> } };

export type RiderOrdersQueryVariables = Exact<{
  riderId: Scalars['ID'];
  filter?: InputMaybe<OrderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<OrderSort> | OrderSort>;
}>;


export type RiderOrdersQuery = { __typename?: 'Query', rider?: { __typename?: 'Rider', orders: { __typename?: 'RiderOrdersConnection', totalCount: number, nodes: Array<{ __typename?: 'Order', id: string, createdOn: any, status: OrderStatus, distanceBest: number, durationBest: number, costBest: number, costAfterCoupon: number, currency: string, addresses: Array<string>, expectedTimestamp?: any | null, points: Array<{ __typename?: 'Point', lat: number, lng: number }> }> } } | null };

export type UpdateRiderMutationVariables = Exact<{
  id: Scalars['ID'];
  update: UpdateRider;
}>;


export type UpdateRiderMutation = { __typename?: 'Mutation', updateOneRider: { __typename?: 'Rider', id: string } };

export type CreateRiderTransactionMutationVariables = Exact<{
  input: RiderTransactionInput;
}>;


export type CreateRiderTransactionMutation = { __typename?: 'Mutation', createRiderTransaction: { __typename?: 'RiderWallet', id: string } };

export type DeleteRiderMutationVariables = Exact<{
  id: Scalars['ID'];
}>;


export type DeleteRiderMutation = { __typename?: 'Mutation', deleteOneRider: { __typename?: 'Rider', id: string } };

export type RidersListQueryVariables = Exact<{
  filter?: InputMaybe<RiderFilter>;
  paging?: InputMaybe<OffsetPaging>;
  sorting?: InputMaybe<Array<RiderSort> | RiderSort>;
}>;


export type RidersListQuery = { __typename?: 'Query', riders: { __typename?: 'RiderConnection', totalCount: number, nodes: Array<{ __typename?: 'Rider', id: string, firstName?: string | null, lastName?: string | null, gender?: string | null, mobileNumber: string, registrationTimestamp: any }> } };

export type SosListQueryVariables = Exact<{
  paging?: InputMaybe<OffsetPaging>;
}>;


export type SosListQuery = { __typename?: 'Query', distressSignals: { __typename?: 'DistressSignalConnection', totalCount: number, nodes: Array<{ __typename?: 'DistressSignal', id: string, createdAt: any, status: SosStatus, location?: { __typename?: 'Point', lat: number, lng: number } | null }> } };

export type ViewSosQueryVariables = Exact<{
  id: Scalars['ID'];
}>;


export type ViewSosQuery = { __typename?: 'Query', distressSignal?: { __typename?: 'DistressSignal', id: string, createdAt: any, status: SosStatus, submittedByRider: boolean, location?: { __typename?: 'Point', lat: number, lng: number } | null, activities: Array<{ __typename?: 'SOSActivity', action: SosActivityAction, createdAt: any, note?: string | null, operator: { __typename?: 'Operator', id: string, firstName?: string | null, lastName?: string | null } }>, order: { __typename?: 'Order', id: string, status: OrderStatus, createdOn: any, startTimestamp?: any | null, finishTimestamp?: any | null, expectedTimestamp?: any | null, costBest: number, costAfterCoupon: number, addresses: Array<string>, currency: string, rider?: { __typename?: 'Rider', id: string, mobileNumber: string, status: RiderStatus, firstName?: string | null, lastName?: string | null, registrationTimestamp: any } | null, driver?: { __typename?: 'Driver', id: string, mobileNumber: string, status: DriverStatus, firstName?: string | null, lastName?: string | null, registrationTimestamp: any } | null } } | null };

export type CreateSosActivityMutationVariables = Exact<{
  activity: CreateSosAcitivtyInput;
}>;


export type CreateSosActivityMutation = { __typename?: 'Mutation', createOneSOSActivity: { __typename?: 'SOSActivity', id: string } };

export type CurrentConfigurationQueryVariables = Exact<{ [key: string]: never; }>;


export type CurrentConfigurationQuery = { __typename?: 'Query', currentConfiguration: { __typename?: 'CurrentConfiguration', purchaseCode?: string | null, backendMapsAPIKey?: string | null, adminPanelAPIKey?: string | null, firebaseProjectPrivateKey?: string | null } };

export type UpdatePurchaseCodeMutationVariables = Exact<{
  code: Scalars['String'];
}>;


export type UpdatePurchaseCodeMutation = { __typename?: 'Mutation', updatePurchaseCode: { __typename?: 'UpdatePurchaseCodeResult', status: UpdatePurchaseCodeStatus, clients?: Array<{ __typename?: 'UpdatePurchaseCodeClient', ip: string }> | null } };

export type UpdateMapsApiKeyMutationVariables = Exact<{
  backend: Scalars['String'];
  adminPanel: Scalars['String'];
}>;


export type UpdateMapsApiKeyMutation = { __typename?: 'Mutation', updateMapsAPIKey: { __typename?: 'UpdateConfigResult', status: UpdateConfigStatus, message?: string | null } };

export type UpdateFirebaseMutationVariables = Exact<{
  keyFileName: Scalars['String'];
}>;


export type UpdateFirebaseMutation = { __typename?: 'Mutation', updateFirebase: { __typename?: 'UpdateConfigResult', status: UpdateConfigStatus, message?: string | null } };

export type DisableServerMutationVariables = Exact<{
  ip: Scalars['String'];
}>;


export type DisableServerMutation = { __typename?: 'Mutation', disablePreviousServer: { __typename?: 'UpdateConfigResult', status: UpdateConfigStatus, message?: string | null } };

export type LoginQueryVariables = Exact<{
  username: Scalars['String'];
  password: Scalars['String'];
}>;


export type LoginQuery = { __typename?: 'Query', login: { __typename?: 'TokenObject', token: string } };

export const DriverOverviewInfoFragmentDoc = gql`
    fragment DriverOverviewInfo on Driver {
  id
  firstName
  lastName
  mobileNumber
  status
}
    `;
export const DriverLocationFragmentDoc = gql`
    fragment DriverLocation on OnlineDriver {
  location {
    lat
    lng
  }
  driverId
  lastUpdatedAt
}
    `;
export const ViewComplaintDocument = gql`
    query ViewComplaint($id: ID!) {
  complaint(id: $id) {
    id
    inscriptionTimestamp
    status
    subject
    content
    requestedByDriver
    activities {
      type
      comment
      actor {
        firstName
        lastName
      }
      assignedTo {
        firstName
        lastName
      }
    }
    order {
      id
      status
      createdOn
      startTimestamp
      finishTimestamp
      expectedTimestamp
      costBest
      costAfterCoupon
      addresses
      currency
      rider {
        id
        mobileNumber
        status
        firstName
        lastName
        registrationTimestamp
      }
      driver {
        id
        mobileNumber
        status
        firstName
        lastName
        registrationTimestamp
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewComplaintGQL extends Apollo.Query<ViewComplaintQuery, ViewComplaintQueryVariables> {
    document = ViewComplaintDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateComplaintStatusDocument = gql`
    mutation UpdateComplaintStatus($id: ID!, $status: ComplaintStatus!) {
  updateOneComplaint(input: {id: $id, update: {status: $status}}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateComplaintStatusGQL extends Apollo.Mutation<UpdateComplaintStatusMutation, UpdateComplaintStatusMutationVariables> {
    document = UpdateComplaintStatusDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ComplaintsListDocument = gql`
    query ComplaintsList($paging: OffsetPaging) {
  complaints(paging: $paging) {
    nodes {
      id
      inscriptionTimestamp
      subject
      status
      content
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ComplaintsListGQL extends Apollo.Query<ComplaintsListQuery, ComplaintsListQueryVariables> {
    document = ComplaintsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateDriverDocument = gql`
    mutation CreateDriver($input: CreateDriver!) {
  createOneDriver(input: {driver: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateDriverGQL extends Apollo.Mutation<CreateDriverMutation, CreateDriverMutationVariables> {
    document = CreateDriverDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewDriverDocument = gql`
    query ViewDriver($id: ID!) {
  driver(id: $id) {
    id
    firstName
    lastName
    mobileNumber
    registrationTimestamp
    lastSeenTimestamp
    status
    gender
    carId
    carColorId
    fleetId
    carProductionYear
    carPlate
    accountNumber
    bankName
    bankRoutingNumber
    bankSwift
    address
    email
    feedbacks {
      nodes {
        parametersAggregate {
          groupBy {
            title
            isGood
          }
          count {
            id
          }
        }
      }
    }
    enabledServices {
      id
    }
    documents {
      id
      address
    }
    media {
      address
    }
    rating
    reviewCount
  }
  services {
    id
    name
  }
  fleets {
    nodes {
      id
      name
    }
  }
  carModels(paging: {limit: 100}) {
    nodes {
      id
      name
    }
  }
  carColors {
    id
    name
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewDriverGQL extends Apollo.Query<ViewDriverQuery, ViewDriverQueryVariables> {
    document = ViewDriverDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateDriverProfileDocument = gql`
    mutation UpdateDriverProfile($id: ID!, $update: UpdateDriverInput!, $serviceIds: [ID!]!) {
  updateOneDriver(input: {id: $id, update: $update}) {
    id
  }
  setEnabledServicesOnDriver(input: {id: $id, relationIds: $serviceIds}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateDriverProfileGQL extends Apollo.Mutation<UpdateDriverProfileMutation, UpdateDriverProfileMutationVariables> {
    document = UpdateDriverProfileDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateDriverStatusDocument = gql`
    mutation UpdateDriverStatus($id: ID!, $status: DriverStatus) {
  updateOneDriver(input: {id: $id, update: {status: $status}}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateDriverStatusGQL extends Apollo.Mutation<UpdateDriverStatusMutation, UpdateDriverStatusMutationVariables> {
    document = UpdateDriverStatusDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriverFinancialsDocument = gql`
    query DriverFinancials($id: ID!, $paging: OffsetPaging, $filter: DriverTransactionFilter, $sorting: [DriverTransactionSort!]) {
  driver(id: $id) {
    transactions(filter: $filter, paging: $paging, sorting: $sorting) {
      nodes {
        status
        createdAt
        amount
        description
        currency
        action
        deductType
        rechargeType
        refrenceNumber
        requestId
        paymentGatewayId
        operatorId
      }
      totalCount
    }
    wallets {
      balance
      currency
    }
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriverFinancialsGQL extends Apollo.Query<DriverFinancialsQuery, DriverFinancialsQueryVariables> {
    document = DriverFinancialsDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriverFeedbacksDocument = gql`
    query DriverFeedbacks($id: ID!, $paging: OffsetPaging) {
  feedbacks(filter: {driverId: {eq: $id}}, paging: $paging) {
    nodes {
      id
      requestId
      reviewTimestamp
      score
      description
      parameters {
        isGood
        title
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriverFeedbacksGQL extends Apollo.Query<DriverFeedbacksQuery, DriverFeedbacksQueryVariables> {
    document = DriverFeedbacksDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriverOrdersDocument = gql`
    query DriverOrders($driverId: ID!, $filter: OrderFilter, $paging: OffsetPaging, $sorting: [OrderSort!]) {
  driver(id: $driverId) {
    orders(filter: $filter, paging: $paging, sorting: $sorting) {
      nodes {
        id
        createdOn
        status
        distanceBest
        durationBest
        costBest
        costAfterCoupon
        currency
        addresses
        points {
          lat
          lng
        }
        expectedTimestamp
      }
      totalCount
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriverOrdersGQL extends Apollo.Query<DriverOrdersQuery, DriverOrdersQueryVariables> {
    document = DriverOrdersDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateDriverTransactionDocument = gql`
    mutation CreateDriverTransaction($input: DriverTransactionInput!) {
  createDriverTransaction(input: $input) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateDriverTransactionGQL extends Apollo.Mutation<CreateDriverTransactionMutation, CreateDriverTransactionMutationVariables> {
    document = CreateDriverTransactionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteDriverDocument = gql`
    mutation DeleteDriver($id: ID!) {
  deleteOneDriver(id: $id) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteDriverGQL extends Apollo.Mutation<DeleteDriverMutation, DeleteDriverMutationVariables> {
    document = DeleteDriverDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriversListDocument = gql`
    query DriversList($paging: OffsetPaging, $filter: DriverFilter, $sorting: [DriverSort!]) {
  drivers(paging: $paging, filter: $filter, sorting: $sorting) {
    nodes {
      id
      firstName
      lastName
      gender
      mobileNumber
      status
      registrationTimestamp
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriversListGQL extends Apollo.Query<DriversListQuery, DriversListQueryVariables> {
    document = DriversListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ProviderWalletsListDocument = gql`
    query ProviderWalletsList($paging: OffsetPaging) {
  providerTransactions(paging: $paging) {
    nodes {
      createdAt
      action
      deductType
      rechargeType
      amount
      currency
      description
      requestId
      operatorId
    }
    totalCount
  }
  providerWallets {
    balance
    currency
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ProviderWalletsListGQL extends Apollo.Query<ProviderWalletsListQuery, ProviderWalletsListQueryVariables> {
    document = ProviderWalletsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ExportDocument = gql`
    query Export($input: ExportArgs!) {
  export(input: $input) {
    url
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ExportGQL extends Apollo.Query<ExportQuery, ExportQueryVariables> {
    document = ExportDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriverWalletsListDocument = gql`
    query DriverWalletsList($paging: OffsetPaging) {
  driverWallets(paging: $paging) {
    nodes {
      id
      driverId
      balance
      currency
      driver {
        firstName
        lastName
      }
    }
    totalCount
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriverWalletsListGQL extends Apollo.Query<DriverWalletsListQuery, DriverWalletsListQueryVariables> {
    document = DriverWalletsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const FleetWalletsListDocument = gql`
    query FleetWalletsList($paging: OffsetPaging, $filter: FleetWalletFilter) {
  fleetWallets(paging: $paging, filter: $filter) {
    nodes {
      id
      balance
      currency
      fleetId
      fleet {
        name
      }
    }
    totalCount
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class FleetWalletsListGQL extends Apollo.Query<FleetWalletsListQuery, FleetWalletsListQueryVariables> {
    document = FleetWalletsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RiderWalletsListDocument = gql`
    query RiderWalletsList($paging: OffsetPaging) {
  riderWallets(paging: $paging) {
    nodes {
      balance
      currency
      riderId
      rider {
        firstName
        lastName
      }
    }
    totalCount
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RiderWalletsListGQL extends Apollo.Query<RiderWalletsListQuery, RiderWalletsListQueryVariables> {
    document = RiderWalletsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DispatcherCalculateFareDocument = gql`
    query DispatcherCalculateFare($points: [PointInput!]!) {
  calculateFare(input: {points: $points}) {
    currency
    distance
    duration
    services {
      name
      services {
        id
        name
        cost
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DispatcherCalculateFareGQL extends Apollo.Query<DispatcherCalculateFareQuery, DispatcherCalculateFareQueryVariables> {
    document = DispatcherCalculateFareDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateOrderDocument = gql`
    mutation CreateOrder($riderId: ID!, $points: [PointInput!]!, $addresses: [String!]!, $serviceId: ID!) {
  createOrder(
    input: {points: $points, serviceId: $serviceId, addresses: $addresses, intervalMinutes: 0, riderId: $riderId}
  ) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateOrderGQL extends Apollo.Mutation<CreateOrderMutation, CreateOrderMutationVariables> {
    document = CreateOrderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const OrderUpdatedDocument = gql`
    subscription OrderUpdated($id: ID!) {
  orderUpdated(orderId: $id) {
    id
    status
    driver {
      firstName
      lastName
      mobileNumber
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class OrderUpdatedGQL extends Apollo.Subscription<OrderUpdatedSubscription, OrderUpdatedSubscriptionVariables> {
    document = OrderUpdatedDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CancelOrderDocument = gql`
    mutation CancelOrder($orderId: ID!) {
  cancelOrder(orderId: $orderId) {
    id
    status
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CancelOrderGQL extends Apollo.Mutation<CancelOrderMutation, CancelOrderMutationVariables> {
    document = CancelOrderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const OverviewDocument = gql`
    query Overview {
  complaintAggregate(filter: {status: {in: [Submitted, UnderInvestigation]}}) {
    count {
      id
    }
  }
  driverAggregate(filter: {status: {eq: PendingApproval}}) {
    count {
      id
    }
  }
  activeOrders: orderAggregate(
    filter: {status: {in: [DriverAccepted, Arrived, Started, WaitingForPostPay]}}
  ) {
    count {
      id
    }
  }
  bookedOrders: orderAggregate(filter: {status: {eq: Booked}}) {
    count {
      id
    }
  }
  getDriversLocation(center: {lat: 45, lng: 45}, count: 150) {
    ...DriverLocation
  }
  drivers(paging: {limit: 5}, filter: {status: {in: [Online, InService]}}) {
    nodes {
      ...DriverOverviewInfo
    }
    totalCount
  }
}
    ${DriverLocationFragmentDoc}
${DriverOverviewInfoFragmentDoc}`;

  @Injectable({
    providedIn: 'root'
  })
  export class OverviewGQL extends Apollo.Query<OverviewQuery, OverviewQueryVariables> {
    document = OverviewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const OverviewDriverPagingDocument = gql`
    query OverviewDriverPaging($offset: Int!) {
  drivers(
    paging: {limit: 5, offset: $offset}
    filter: {status: {in: [Online, InService]}}
  ) {
    nodes {
      ...DriverOverviewInfo
    }
    totalCount
  }
}
    ${DriverOverviewInfoFragmentDoc}`;

  @Injectable({
    providedIn: 'root'
  })
  export class OverviewDriverPagingGQL extends Apollo.Query<OverviewDriverPagingQuery, OverviewDriverPagingQueryVariables> {
    document = OverviewDriverPagingDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RequestsChartDocument = gql`
    query RequestsChart($timeframe: ChartTimeframe!) {
  requestChart(timeframe: $timeframe) {
    items {
      time
      count
      status
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RequestsChartGQL extends Apollo.Query<RequestsChartQuery, RequestsChartQueryVariables> {
    document = RequestsChartDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const IncomeChartDocument = gql`
    query IncomeChart($timeframe: ChartTimeframe!) {
  incomeChart(timeframe: $timeframe) {
    items {
      time
      sum
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class IncomeChartGQL extends Apollo.Query<IncomeChartQuery, IncomeChartQueryVariables> {
    document = IncomeChartDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CarsListDocument = gql`
    query CarsList {
  carModels(paging: {limit: 100}) {
    nodes {
      id
      name
    }
  }
  carColors {
    id
    name
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CarsListGQL extends Apollo.Query<CarsListQuery, CarsListQueryVariables> {
    document = CarsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteCarModelDocument = gql`
    mutation DeleteCarModel($id: ID!) {
  deleteOneCarModel(input: {id: $id}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteCarModelGQL extends Apollo.Mutation<DeleteCarModelMutation, DeleteCarModelMutationVariables> {
    document = DeleteCarModelDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteCarColorDocument = gql`
    mutation DeleteCarColor($id: ID!) {
  deleteOneCarColor(input: {id: $id}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteCarColorGQL extends Apollo.Mutation<DeleteCarColorMutation, DeleteCarColorMutationVariables> {
    document = DeleteCarColorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateCarModelDocument = gql`
    mutation CreateCarModel($input: CreateCarModel!) {
  createOneCarModel(input: {carModel: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateCarModelGQL extends Apollo.Mutation<CreateCarModelMutation, CreateCarModelMutationVariables> {
    document = CreateCarModelDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateCarColorDocument = gql`
    mutation CreateCarColor($input: CreateCarColor!) {
  createOneCarColor(input: {carColor: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateCarColorGQL extends Apollo.Mutation<CreateCarColorMutation, CreateCarColorMutationVariables> {
    document = CreateCarColorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateCarModelDocument = gql`
    mutation UpdateCarModel($id: ID!, $input: UpdateCarModel!) {
  updateOneCarModel(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateCarModelGQL extends Apollo.Mutation<UpdateCarModelMutation, UpdateCarModelMutationVariables> {
    document = UpdateCarModelDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateCarColorDocument = gql`
    mutation UpdateCarColor($id: ID!, $input: UpdateCarColor!) {
  updateOneCarColor(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateCarColorGQL extends Apollo.Mutation<UpdateCarColorMutation, UpdateCarColorMutationVariables> {
    document = UpdateCarColorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateFleetDocument = gql`
    mutation CreateFleet($input: CreateFleet!) {
  createOneFleet(input: {fleet: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateFleetGQL extends Apollo.Mutation<CreateFleetMutation, CreateFleetMutationVariables> {
    document = CreateFleetDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewFleetDocument = gql`
    query ViewFleet($id: ID!) {
  fleet(id: $id) {
    id
    name
    phoneNumber
    address
    mobileNumber
    accountNumber
    commissionSharePercent
    commissionShareFlat
    feeMultiplier
    exclusivityAreas {
      lat
      lng
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewFleetGQL extends Apollo.Query<ViewFleetQuery, ViewFleetQueryVariables> {
    document = ViewFleetDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const FleetFinancialsDocument = gql`
    query FleetFinancials($id: ID!, $paging: OffsetPaging, $filter: FleetTransactionFilter, $sorting: [FleetTransactionSort!]) {
  fleet(id: $id) {
    transactions(paging: $paging, filter: $filter, sorting: $sorting) {
      nodes {
        transactionTimestamp
        amount
        currency
        action
        deductType
        rechargeType
        refrenceNumber
        operatorId
        requestId
        description
      }
      totalCount
    }
    wallets {
      currency
      balance
    }
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class FleetFinancialsGQL extends Apollo.Query<FleetFinancialsQuery, FleetFinancialsQueryVariables> {
    document = FleetFinancialsDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const FleetZonePricesDocument = gql`
    query FleetZonePrices($id: ID!, $paging: OffsetPaging, $filter: ZonePriceFilter, $sorting: [ZonePriceSort!]) {
  fleet(id: $id) {
    zonePrices(paging: $paging, filter: $filter, sorting: $sorting) {
      nodes {
        id
        name
      }
      totalCount
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class FleetZonePricesGQL extends Apollo.Query<FleetZonePricesQuery, FleetZonePricesQueryVariables> {
    document = FleetZonePricesDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const FleetDriversDocument = gql`
    query FleetDrivers($id: ID!, $paging: OffsetPaging) {
  drivers(filter: {fleetId: {eq: $id}}, paging: $paging) {
    nodes {
      id
      firstName
      lastName
      mobileNumber
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class FleetDriversGQL extends Apollo.Query<FleetDriversQuery, FleetDriversQueryVariables> {
    document = FleetDriversDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateFleetDocument = gql`
    mutation UpdateFleet($id: ID!, $update: UpdateFleet!) {
  updateOneFleet(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateFleetGQL extends Apollo.Mutation<UpdateFleetMutation, UpdateFleetMutationVariables> {
    document = UpdateFleetDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateFleetTransactionDocument = gql`
    mutation CreateFleetTransaction($input: FleetTransactionInput!) {
  createFleetTransaction(input: $input) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateFleetTransactionGQL extends Apollo.Mutation<CreateFleetTransactionMutation, CreateFleetTransactionMutationVariables> {
    document = CreateFleetTransactionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const FleetsListDocument = gql`
    query FleetsList($paging: OffsetPaging, $filter: FleetFilter) {
  fleets(paging: $paging, filter: $filter) {
    nodes {
      id
      name
      phoneNumber
      address
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class FleetsListGQL extends Apollo.Query<FleetsListQuery, FleetsListQueryVariables> {
    document = FleetsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewPaymentGatewayDocument = gql`
    query ViewPaymentGateway($id: ID!) {
  paymentGateway(id: $id) {
    id
    title
    type
    enabled
    privateKey
    publicKey
    merchantId
    saltKey
    mediaId
    media {
      address
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewPaymentGatewayGQL extends Apollo.Query<ViewPaymentGatewayQuery, ViewPaymentGatewayQueryVariables> {
    document = ViewPaymentGatewayDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreatePaymentGatewayDocument = gql`
    mutation CreatePaymentGateway($input: CreatePaymentGateway!) {
  createOnePaymentGateway(input: {paymentGateway: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreatePaymentGatewayGQL extends Apollo.Mutation<CreatePaymentGatewayMutation, CreatePaymentGatewayMutationVariables> {
    document = CreatePaymentGatewayDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdatePaymentGatewayDocument = gql`
    mutation UpdatePaymentGateway($id: ID!, $input: UpdatePaymentGateway!) {
  updateOnePaymentGateway(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdatePaymentGatewayGQL extends Apollo.Mutation<UpdatePaymentGatewayMutation, UpdatePaymentGatewayMutationVariables> {
    document = UpdatePaymentGatewayDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const PaymentGatewaysDocument = gql`
    query PaymentGateways($paging: OffsetPaging) {
  paymentGateways(paging: $paging) {
    nodes {
      id
      enabled
      title
      type
      media {
        address
      }
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class PaymentGatewaysGQL extends Apollo.Query<PaymentGatewaysQuery, PaymentGatewaysQueryVariables> {
    document = PaymentGatewaysDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RegionListDocument = gql`
    query RegionList($paging: OffsetPaging) {
  regions(paging: $paging) {
    nodes {
      id
      name
      currency
      enabled
      location {
        lat
        lng
      }
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RegionListGQL extends Apollo.Query<RegionListQuery, RegionListQueryVariables> {
    document = RegionListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RegionViewDocument = gql`
    query RegionView($id: ID!) {
  region(id: $id) {
    id
    name
    currency
    enabled
    location {
      lat
      lng
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RegionViewGQL extends Apollo.Query<RegionViewQuery, RegionViewQueryVariables> {
    document = RegionViewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateRegionDocument = gql`
    mutation UpdateRegion($id: ID!, $update: UpdateRegion!) {
  updateOneRegion(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateRegionGQL extends Apollo.Mutation<UpdateRegionMutation, UpdateRegionMutationVariables> {
    document = UpdateRegionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateRegionDocument = gql`
    mutation CreateRegion($input: CreateRegion!) {
  createOneRegion(input: {region: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateRegionGQL extends Apollo.Mutation<CreateRegionMutation, CreateRegionMutationVariables> {
    document = CreateRegionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ReviewParameterViewDocument = gql`
    query ReviewParameterView($id: ID!) {
  feedbackParameter(id: $id) {
    id
    title
    isGood
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ReviewParameterViewGQL extends Apollo.Query<ReviewParameterViewQuery, ReviewParameterViewQueryVariables> {
    document = ReviewParameterViewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateReviewParameterDocument = gql`
    mutation UpdateReviewParameter($id: ID!, $update: UpdateFeedbackParameter!) {
  updateOneFeedbackParameter(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateReviewParameterGQL extends Apollo.Mutation<UpdateReviewParameterMutation, UpdateReviewParameterMutationVariables> {
    document = UpdateReviewParameterDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateReviewParameterDocument = gql`
    mutation CreateReviewParameter($input: CreateFeedbackParameter!) {
  createOneFeedbackParameter(input: {feedbackParameter: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateReviewParameterGQL extends Apollo.Mutation<CreateReviewParameterMutation, CreateReviewParameterMutationVariables> {
    document = CreateReviewParameterDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ReviewParametersListDocument = gql`
    query ReviewParametersList {
  feedbackParameters {
    id
    title
    isGood
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ReviewParametersListGQL extends Apollo.Query<ReviewParametersListQuery, ReviewParametersListQueryVariables> {
    document = ReviewParametersListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RolesDocument = gql`
    query Roles {
  operatorRoles {
    id
    title
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RolesGQL extends Apollo.Query<RolesQuery, RolesQueryVariables> {
    document = RolesDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RoleDocument = gql`
    query Role($id: ID!) {
  operatorRole(id: $id) {
    id
    title
    permissions
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RoleGQL extends Apollo.Query<RoleQuery, RoleQueryVariables> {
    document = RoleDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateRoleDocument = gql`
    mutation CreateRole($input: CreateOperatorRole!) {
  createOneOperatorRole(input: {operatorRole: $input}) {
    id
    title
    permissions
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateRoleGQL extends Apollo.Mutation<CreateRoleMutation, CreateRoleMutationVariables> {
    document = CreateRoleDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateRoleDocument = gql`
    mutation UpdateRole($id: ID!, $input: UpdateOperatorRole!) {
  updateOneOperatorRole(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateRoleGQL extends Apollo.Mutation<UpdateRoleMutation, UpdateRoleMutationVariables> {
    document = UpdateRoleDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ServiceOptionViewDocument = gql`
    query ServiceOptionView($id: ID!) {
  serviceOption(id: $id) {
    id
    name
    type
    icon
    additionalFee
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ServiceOptionViewGQL extends Apollo.Query<ServiceOptionViewQuery, ServiceOptionViewQueryVariables> {
    document = ServiceOptionViewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateServiceOptionDocument = gql`
    mutation UpdateServiceOption($id: ID!, $update: UpdateServiceOption!) {
  updateOneServiceOption(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateServiceOptionGQL extends Apollo.Mutation<UpdateServiceOptionMutation, UpdateServiceOptionMutationVariables> {
    document = UpdateServiceOptionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateServiceOptionDocument = gql`
    mutation CreateServiceOption($input: CreateServiceOption!) {
  createOneServiceOption(input: {serviceOption: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateServiceOptionGQL extends Apollo.Mutation<CreateServiceOptionMutation, CreateServiceOptionMutationVariables> {
    document = CreateServiceOptionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ServiceOptionsListDocument = gql`
    query ServiceOptionsList {
  serviceOptions {
    id
    name
    icon
    type
    additionalFee
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ServiceOptionsListGQL extends Apollo.Query<ServiceOptionsListQuery, ServiceOptionsListQueryVariables> {
    document = ServiceOptionsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewServiceCategoryDocument = gql`
    query ViewServiceCategory($id: ID!) {
  serviceCategory(id: $id) {
    id
    name
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewServiceCategoryGQL extends Apollo.Query<ViewServiceCategoryQuery, ViewServiceCategoryQueryVariables> {
    document = ViewServiceCategoryDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateServiceCategoryDocument = gql`
    mutation CreateServiceCategory($input: CreateServiceCategory!) {
  createOneServiceCategory(input: {serviceCategory: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateServiceCategoryGQL extends Apollo.Mutation<CreateServiceCategoryMutation, CreateServiceCategoryMutationVariables> {
    document = CreateServiceCategoryDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateServiceCategoryDocument = gql`
    mutation UpdateServiceCategory($id: ID!, $input: UpdateServiceCategory!) {
  updateOneServiceCategory(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateServiceCategoryGQL extends Apollo.Mutation<UpdateServiceCategoryMutation, UpdateServiceCategoryMutationVariables> {
    document = UpdateServiceCategoryDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteServiceCategoryDocument = gql`
    mutation DeleteServiceCategory($id: ID!) {
  deleteOneServiceCategory(input: {id: $id}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteServiceCategoryGQL extends Apollo.Mutation<DeleteServiceCategoryMutation, DeleteServiceCategoryMutationVariables> {
    document = DeleteServiceCategoryDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ServicesListDocument = gql`
    query ServicesList {
  serviceCategories {
    id
    name
    services {
      id
      name
      description
      media {
        address
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ServicesListGQL extends Apollo.Query<ServicesListQuery, ServicesListQueryVariables> {
    document = ServicesListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewServiceDocument = gql`
    query ViewService($id: ID!) {
  service(id: $id) {
    id
    name
    categoryId
    baseFare
    perHundredMeters
    perMinuteDrive
    perMinuteWait
    minimumFee
    searchRadius
    maximumDestinationDistance
    paymentMethod
    cancellationTotalFee
    cancellationDriverShare
    providerShareFlat
    providerSharePercent
    prepayPercent
    searchRadius
    mediaId
    description
    personCapacity
    roundingFactor
    media {
      address
    }
    timeMultipliers {
      startTime
      endTime
      multiply
    }
    distanceMultipliers {
      distanceFrom
      distanceTo
      multiply
    }
    options {
      id
      name
      type
      additionalFee
      icon
    }
    regions {
      id
      name
      currency
    }
  }
  regions {
    nodes {
      id
      name
      currency
    }
  }
  serviceCategories {
    id
    name
  }
  serviceOptions {
    id
    name
    icon
    type
    additionalFee
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewServiceGQL extends Apollo.Query<ViewServiceQuery, ViewServiceQueryVariables> {
    document = ViewServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const NewServiceDocument = gql`
    query NewService {
  regions {
    nodes {
      id
      name
      currency
    }
  }
  serviceCategories {
    id
    name
  }
  serviceOptions {
    id
    name
    icon
    type
    additionalFee
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class NewServiceGQL extends Apollo.Query<NewServiceQuery, NewServiceQueryVariables> {
    document = NewServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateServiceDocument = gql`
    mutation CreateService($input: CreateService!) {
  createOneService(input: {service: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateServiceGQL extends Apollo.Mutation<CreateServiceMutation, CreateServiceMutationVariables> {
    document = CreateServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteServiceDocument = gql`
    mutation DeleteService($id: ID!) {
  deleteOneService(input: {id: $id}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteServiceGQL extends Apollo.Mutation<DeleteServiceMutation, DeleteServiceMutationVariables> {
    document = DeleteServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateServiceDocument = gql`
    mutation UpdateService($id: ID!, $input: UpdateService!) {
  updateOneService(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateServiceGQL extends Apollo.Mutation<UpdateServiceMutation, UpdateServiceMutationVariables> {
    document = UpdateServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const SetRegionsOnServiceDocument = gql`
    mutation SetRegionsOnService($id: ID!, $relationIds: [ID!]!) {
  setRegionsOnService(input: {id: $id, relationIds: $relationIds}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class SetRegionsOnServiceGQL extends Apollo.Mutation<SetRegionsOnServiceMutation, SetRegionsOnServiceMutationVariables> {
    document = SetRegionsOnServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const SetOptionsOnServiceDocument = gql`
    mutation SetOptionsOnService($id: ID!, $relationIds: [ID!]!) {
  setOptionsOnService(input: {id: $id, relationIds: $relationIds}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class SetOptionsOnServiceGQL extends Apollo.Mutation<SetOptionsOnServiceMutation, SetOptionsOnServiceMutationVariables> {
    document = SetOptionsOnServiceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdatePasswordDocument = gql`
    mutation UpdatePassword($input: UpdatePasswordInput!) {
  updatePassword(input: $input) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdatePasswordGQL extends Apollo.Mutation<UpdatePasswordMutation, UpdatePasswordMutationVariables> {
    document = UpdatePasswordDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateOperatorDocument = gql`
    mutation CreateOperator($input: CreateOperatorInput!) {
  createOneOperator(input: {operator: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateOperatorGQL extends Apollo.Mutation<CreateOperatorMutation, CreateOperatorMutationVariables> {
    document = CreateOperatorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewOperatorDocument = gql`
    query ViewOperator($id: ID!) {
  operator(id: $id) {
    id
    firstName
    lastName
    mobileNumber
    userName
    email
    roleId
  }
  operatorRoles {
    id
    title
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewOperatorGQL extends Apollo.Query<ViewOperatorQuery, ViewOperatorQueryVariables> {
    document = ViewOperatorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const NewOperatorDocument = gql`
    query NewOperator {
  operatorRoles {
    id
    title
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class NewOperatorGQL extends Apollo.Query<NewOperatorQuery, NewOperatorQueryVariables> {
    document = NewOperatorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateOperatorDocument = gql`
    mutation UpdateOperator($id: ID!, $update: UpdateOperator!) {
  updateOneOperator(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateOperatorGQL extends Apollo.Mutation<UpdateOperatorMutation, UpdateOperatorMutationVariables> {
    document = UpdateOperatorDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UsersListDocument = gql`
    query UsersList($paging: OffsetPaging) {
  operators(paging: $paging) {
    nodes {
      id
      userName
      firstName
      lastName
      role {
        title
      }
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UsersListGQL extends Apollo.Query<UsersListQuery, UsersListQueryVariables> {
    document = UsersListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ZonePriceViewDocument = gql`
    query ZonePriceView($id: ID!) {
  zonePrice(id: $id) {
    id
    name
    from {
      lat
      lng
    }
    to {
      lat
      lng
    }
    cost
    services {
      id
    }
    fleets {
      id
    }
    timeMultipliers {
      startTime
      endTime
      multiply
    }
  }
  fleets(paging: {limit: 50}) {
    nodes {
      id
      name
    }
  }
  services {
    id
    name
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ZonePriceViewGQL extends Apollo.Query<ZonePriceViewQuery, ZonePriceViewQueryVariables> {
    document = ZonePriceViewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ZonePriceNewDocument = gql`
    query ZonePriceNew {
  fleets(paging: {limit: 50}) {
    nodes {
      id
      name
    }
  }
  services {
    id
    name
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ZonePriceNewGQL extends Apollo.Query<ZonePriceNewQuery, ZonePriceNewQueryVariables> {
    document = ZonePriceNewDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateZonePriceDocument = gql`
    mutation UpdateZonePrice($id: ID!, $update: UpdateZonePrice!) {
  updateOneZonePrice(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateZonePriceGQL extends Apollo.Mutation<UpdateZonePriceMutation, UpdateZonePriceMutationVariables> {
    document = UpdateZonePriceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateZonePriceDocument = gql`
    mutation CreateZonePrice($input: CreateZonePrice!) {
  createOneZonePrice(input: {zonePrice: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateZonePriceGQL extends Apollo.Mutation<CreateZonePriceMutation, CreateZonePriceMutationVariables> {
    document = CreateZonePriceDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const SetZonePriceRelationsDocument = gql`
    mutation SetZonePriceRelations($id: ID!, $services: [ID!]!, $fleets: [ID!]!) {
  setServicesOnZonePrice(input: {id: $id, relationIds: $services}) {
    id
  }
  setFleetsOnZonePrice(input: {id: $id, relationIds: $fleets}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class SetZonePriceRelationsGQL extends Apollo.Mutation<SetZonePriceRelationsMutation, SetZonePriceRelationsMutationVariables> {
    document = SetZonePriceRelationsDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ZonePricesListDocument = gql`
    query ZonePricesList($paging: OffsetPaging) {
  zonePrices(paging: $paging) {
    nodes {
      id
      name
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ZonePricesListGQL extends Apollo.Query<ZonePricesListQuery, ZonePricesListQueryVariables> {
    document = ZonePricesListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewAnnouncementDocument = gql`
    query ViewAnnouncement($id: ID!) {
  announcement(id: $id) {
    id
    title
    userType
    description
    url
    startAt
    expireAt
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewAnnouncementGQL extends Apollo.Query<ViewAnnouncementQuery, ViewAnnouncementQueryVariables> {
    document = ViewAnnouncementDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateAnnouncementDocument = gql`
    mutation CreateAnnouncement($input: CreateAnnouncement!) {
  createOneAnnouncement(input: {announcement: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateAnnouncementGQL extends Apollo.Mutation<CreateAnnouncementMutation, CreateAnnouncementMutationVariables> {
    document = CreateAnnouncementDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateAnnouncementDocument = gql`
    mutation UpdateAnnouncement($id: ID!, $input: UpdateAnnouncement!) {
  updateOneAnnouncement(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateAnnouncementGQL extends Apollo.Mutation<UpdateAnnouncementMutation, UpdateAnnouncementMutationVariables> {
    document = UpdateAnnouncementDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const AnnouncementsListDocument = gql`
    query AnnouncementsList($paging: OffsetPaging) {
  announcements(paging: $paging) {
    nodes {
      id
      title
      description
      startAt
      expireAt
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class AnnouncementsListGQL extends Apollo.Query<AnnouncementsListQuery, AnnouncementsListQueryVariables> {
    document = AnnouncementsListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewCouponDocument = gql`
    query ViewCoupon($id: ID!) {
  coupon(id: $id) {
    id
    isEnabled
    code
    title
    description
    manyUsersCanUse
    manyTimesUserCanUse
    minimumCost
    maximumCost
    startAt
    expireAt
    discountPercent
    discountFlat
    creditGift
    isEnabled
    isFirstTravelOnly
    allowedServices {
      id
      name
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewCouponGQL extends Apollo.Query<ViewCouponQuery, ViewCouponQueryVariables> {
    document = ViewCouponDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateCouponDocument = gql`
    mutation CreateCoupon($input: CreateCoupon!) {
  createOneCoupon(input: {coupon: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateCouponGQL extends Apollo.Mutation<CreateCouponMutation, CreateCouponMutationVariables> {
    document = CreateCouponDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateCouponDocument = gql`
    mutation UpdateCoupon($id: ID!, $input: UpdateCoupon!) {
  updateOneCoupon(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateCouponGQL extends Apollo.Mutation<UpdateCouponMutation, UpdateCouponMutationVariables> {
    document = UpdateCouponDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CouponListDocument = gql`
    query CouponList($paging: OffsetPaging) {
  coupons(paging: $paging) {
    nodes {
      id
      code
      title
      isEnabled
      description
      startAt
      expireAt
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CouponListGQL extends Apollo.Query<CouponListQuery, CouponListQueryVariables> {
    document = CouponListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RewardListDocument = gql`
    query RewardList($paging: OffsetPaging) {
  rewards(paging: $paging) {
    nodes {
      id
      title
      startDate
      endDate
      beneficiary
      event
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RewardListGQL extends Apollo.Query<RewardListQuery, RewardListQueryVariables> {
    document = RewardListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewRewardDocument = gql`
    query ViewReward($id: ID!) {
  reward(id: $id) {
    id
    title
    startDate
    endDate
    appType
    beneficiary
    event
    creditGift
    tripFeePercentGift
    creditCurrency
    conditionTripCountsLessThan
    conditionUserNumberFirstDigits
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewRewardGQL extends Apollo.Query<ViewRewardQuery, ViewRewardQueryVariables> {
    document = ViewRewardDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateRewardDocument = gql`
    mutation CreateReward($input: CreateReward!) {
  createOneReward(input: {reward: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateRewardGQL extends Apollo.Mutation<CreateRewardMutation, CreateRewardMutationVariables> {
    document = CreateRewardDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateRewardDocument = gql`
    mutation UpdateReward($id: ID!, $input: UpdateReward!) {
  updateOneReward(input: {id: $id, update: $input}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateRewardGQL extends Apollo.Mutation<UpdateRewardMutation, UpdateRewardMutationVariables> {
    document = UpdateRewardDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const AvailableDriversForOrderDocument = gql`
    query AvailableDriversForOrder($center: PointInput!, $count: Int!) {
  getDriversLocationWithData(center: $center, count: $count) {
    id
    location {
      lat
      lng
    }
    mobileNumber
    firstName
    lastName
    lastUpdatedAt
    rating
    reviewCount
    status
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class AvailableDriversForOrderGQL extends Apollo.Query<AvailableDriversForOrderQuery, AvailableDriversForOrderQueryVariables> {
    document = AvailableDriversForOrderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DriverSearchDocument = gql`
    query DriverSearch($filter: String!) {
  drivers(
    filter: {or: [{mobileNumber: {like: $filter}}, {lastName: {like: $filter}}]}
  ) {
    nodes {
      id
      mobileNumber
      firstName
      lastName
      rating
      reviewCount
      status
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DriverSearchGQL extends Apollo.Query<DriverSearchQuery, DriverSearchQueryVariables> {
    document = DriverSearchDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const AssignDriverToOrderDocument = gql`
    mutation AssignDriverToOrder($orderId: ID!, $driverId: ID!) {
  assignDriverToOrder(orderId: $orderId, driverId: $driverId) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class AssignDriverToOrderGQL extends Apollo.Mutation<AssignDriverToOrderMutation, AssignDriverToOrderMutationVariables> {
    document = AssignDriverToOrderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewOrderDocument = gql`
    query ViewOrder($id: ID!) {
  order(id: $id) {
    id
    createdOn
    costBest
    costAfterCoupon
    status
    currency
    distanceBest
    durationBest
    startTimestamp
    finishTimestamp
    addresses
    points {
      lat
      lng
    }
    service {
      name
    }
    driver {
      id
      firstName
      lastName
      mobileNumber
      registrationTimestamp
      status
      media {
        address
      }
    }
    rider {
      id
      firstName
      lastName
      mobileNumber
      registrationTimestamp
      status
      media {
        address
      }
    }
    complaints {
      id
      subject
      inscriptionTimestamp
      content
      requestedByDriver
    }
    conversations {
      sentAt
      sentByDriver
      status
      content
    }
    activities {
      createdAt
      type
    }
    coupon {
      title
      code
      expireAt
    }
    riderTransactions {
      action
      rechargeType
      deductType
      amount
      status
      currency
      refrenceNumber
      paymentGateway {
        title
      }
    }
    driverTransactions {
      action
      rechargeType
      deductType
      amount
      status
      currency
      refrenceNumber
    }
    providerTransactions {
      action
      rechargeType
      deductType
      amount
      currency
      refrenceNumber
    }
    fleetTransactions {
      action
      rechargeType
      deductType
      amount
      currency
      refrenceNumber
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewOrderGQL extends Apollo.Query<ViewOrderQuery, ViewOrderQueryVariables> {
    document = ViewOrderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const OrdersListDocument = gql`
    query OrdersList($paging: OffsetPaging, $filter: OrderFilter, $sorting: [OrderSort!]) {
  orders(paging: $paging, filter: $filter, sorting: $sorting) {
    nodes {
      id
      status
      createdOn
      costAfterCoupon
      currency
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class OrdersListGQL extends Apollo.Query<OrdersListQuery, OrdersListQueryVariables> {
    document = OrdersListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateRiderDocument = gql`
    mutation CreateRider($input: CreateRider!) {
  createOneRider(input: {rider: $input}) {
    id
    firstName
    lastName
    mobileNumber
    gender
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateRiderGQL extends Apollo.Mutation<CreateRiderMutation, CreateRiderMutationVariables> {
    document = CreateRiderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewRiderDocument = gql`
    query ViewRider($id: ID!) {
  rider(id: $id) {
    id
    status
    firstName
    lastName
    mobileNumber
    isResident
    idNumber
    media {
      address
    }
    mobileNumber
    registrationTimestamp
    email
    gender
    wallets(sorting: [{field: balance, direction: DESC}], paging: {limit: 1}) {
      nodes {
        balance
        currency
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewRiderGQL extends Apollo.Query<ViewRiderQuery, ViewRiderQueryVariables> {
    document = ViewRiderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RiderAddressesDocument = gql`
    query RiderAddresses($riderId: ID!, $paging: OffsetPaging) {
  riderAddresses(filter: {riderId: {eq: $riderId}}, paging: $paging) {
    nodes {
      title
      details
      location {
        lat
        lng
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RiderAddressesGQL extends Apollo.Query<RiderAddressesQuery, RiderAddressesQueryVariables> {
    document = RiderAddressesDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RiderWalletDocument = gql`
    query RiderWallet($riderId: ID!, $paging: OffsetPaging, $filter: RiderTransactionFilter, $sorting: [RiderTransactionSort!]) {
  rider(id: $riderId) {
    wallets {
      nodes {
        balance
        currency
      }
    }
    transactions(paging: $paging, sorting: $sorting, filter: $filter) {
      nodes {
        action
        deductType
        status
        createdAt
        rechargeType
        amount
        currency
        refrenceNumber
        description
        paymentGatewayId
        operatorId
        requestId
      }
      totalCount
    }
  }
  regions {
    nodes {
      currency
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RiderWalletGQL extends Apollo.Query<RiderWalletQuery, RiderWalletQueryVariables> {
    document = RiderWalletDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RiderOrdersDocument = gql`
    query RiderOrders($riderId: ID!, $filter: OrderFilter, $paging: OffsetPaging, $sorting: [OrderSort!]) {
  rider(id: $riderId) {
    orders(paging: $paging, filter: $filter, sorting: $sorting) {
      nodes {
        id
        createdOn
        status
        distanceBest
        durationBest
        costBest
        costAfterCoupon
        currency
        addresses
        points {
          lat
          lng
        }
        expectedTimestamp
      }
      totalCount
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RiderOrdersGQL extends Apollo.Query<RiderOrdersQuery, RiderOrdersQueryVariables> {
    document = RiderOrdersDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateRiderDocument = gql`
    mutation UpdateRider($id: ID!, $update: UpdateRider!) {
  updateOneRider(input: {id: $id, update: $update}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateRiderGQL extends Apollo.Mutation<UpdateRiderMutation, UpdateRiderMutationVariables> {
    document = UpdateRiderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateRiderTransactionDocument = gql`
    mutation CreateRiderTransaction($input: RiderTransactionInput!) {
  createRiderTransaction(input: $input) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateRiderTransactionGQL extends Apollo.Mutation<CreateRiderTransactionMutation, CreateRiderTransactionMutationVariables> {
    document = CreateRiderTransactionDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DeleteRiderDocument = gql`
    mutation DeleteRider($id: ID!) {
  deleteOneRider(id: $id) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DeleteRiderGQL extends Apollo.Mutation<DeleteRiderMutation, DeleteRiderMutationVariables> {
    document = DeleteRiderDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const RidersListDocument = gql`
    query RidersList($filter: RiderFilter, $paging: OffsetPaging, $sorting: [RiderSort!]) {
  riders(filter: $filter, paging: $paging, sorting: $sorting) {
    nodes {
      id
      firstName
      lastName
      gender
      mobileNumber
      registrationTimestamp
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class RidersListGQL extends Apollo.Query<RidersListQuery, RidersListQueryVariables> {
    document = RidersListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const SosListDocument = gql`
    query SOSList($paging: OffsetPaging) {
  distressSignals(paging: $paging) {
    nodes {
      id
      createdAt
      status
      location {
        lat
        lng
      }
    }
    totalCount
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class SosListGQL extends Apollo.Query<SosListQuery, SosListQueryVariables> {
    document = SosListDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const ViewSosDocument = gql`
    query ViewSOS($id: ID!) {
  distressSignal(id: $id) {
    id
    createdAt
    status
    submittedByRider
    location {
      lat
      lng
    }
    activities {
      action
      createdAt
      note
      operator {
        id
        firstName
        lastName
      }
    }
    order {
      id
      status
      createdOn
      startTimestamp
      finishTimestamp
      expectedTimestamp
      costBest
      costAfterCoupon
      addresses
      currency
      rider {
        id
        mobileNumber
        status
        firstName
        lastName
        registrationTimestamp
      }
      driver {
        id
        mobileNumber
        status
        firstName
        lastName
        registrationTimestamp
      }
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class ViewSosGQL extends Apollo.Query<ViewSosQuery, ViewSosQueryVariables> {
    document = ViewSosDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CreateSosActivityDocument = gql`
    mutation CreateSOSActivity($activity: CreateSOSAcitivtyInput!) {
  createOneSOSActivity(input: {sOSActivity: $activity}) {
    id
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CreateSosActivityGQL extends Apollo.Mutation<CreateSosActivityMutation, CreateSosActivityMutationVariables> {
    document = CreateSosActivityDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const CurrentConfigurationDocument = gql`
    query CurrentConfiguration {
  currentConfiguration {
    purchaseCode
    backendMapsAPIKey
    adminPanelAPIKey
    firebaseProjectPrivateKey
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class CurrentConfigurationGQL extends Apollo.Query<CurrentConfigurationQuery, CurrentConfigurationQueryVariables> {
    document = CurrentConfigurationDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdatePurchaseCodeDocument = gql`
    mutation UpdatePurchaseCode($code: String!) {
  updatePurchaseCode(purchaseCode: $code) {
    status
    clients {
      ip
    }
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdatePurchaseCodeGQL extends Apollo.Mutation<UpdatePurchaseCodeMutation, UpdatePurchaseCodeMutationVariables> {
    document = UpdatePurchaseCodeDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateMapsApiKeyDocument = gql`
    mutation UpdateMapsAPIKey($backend: String!, $adminPanel: String!) {
  updateMapsAPIKey(backend: $backend, adminPanel: $adminPanel) {
    status
    message
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateMapsApiKeyGQL extends Apollo.Mutation<UpdateMapsApiKeyMutation, UpdateMapsApiKeyMutationVariables> {
    document = UpdateMapsApiKeyDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const UpdateFirebaseDocument = gql`
    mutation UpdateFirebase($keyFileName: String!) {
  updateFirebase(keyFileName: $keyFileName) {
    status
    message
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class UpdateFirebaseGQL extends Apollo.Mutation<UpdateFirebaseMutation, UpdateFirebaseMutationVariables> {
    document = UpdateFirebaseDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const DisableServerDocument = gql`
    mutation DisableServer($ip: String!) {
  disablePreviousServer(ip: $ip) {
    status
    message
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class DisableServerGQL extends Apollo.Mutation<DisableServerMutation, DisableServerMutationVariables> {
    document = DisableServerDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }
export const LoginDocument = gql`
    query Login($username: String!, $password: String!) {
  login(userName: $username, password: $password) {
    token
  }
}
    `;

  @Injectable({
    providedIn: 'root'
  })
  export class LoginGQL extends Apollo.Query<LoginQuery, LoginQueryVariables> {
    document = LoginDocument;
    
    constructor(apollo: Apollo.Apollo) {
      super(apollo);
    }
  }