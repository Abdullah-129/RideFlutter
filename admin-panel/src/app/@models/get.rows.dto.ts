export interface GetRowsDto {
    table: string,
    filters?: object,
    sort?: Sort,
    page?: number,
    pageSize?: number,
    fullTextFields?: string[],
    fullTextValue?: string,
    relations?: string[]
}

export interface Sort {
    direction: 'ASC' | 'DESC'
    property: string
}
export type SortDirection = 'ASC' | 'DESC'