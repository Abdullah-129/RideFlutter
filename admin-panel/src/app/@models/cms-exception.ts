export default class CMSException {
    status: CMSErrorStatus;
    message: string;
    constructor(status: CMSErrorStatus, message: string) {
      this.status = status;
      this.message = message;
    }
}

export enum CMSErrorStatus {
  PermissionDenied = "PermissionDenied",
  Unknown = 'Unknown'
}
