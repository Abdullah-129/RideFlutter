import { Logger } from "@nestjs/common";
import { FieldMiddleware, MiddlewareContext, NextFn } from "@nestjs/graphql";

export const numberMasker: FieldMiddleware = async (
    ctx: MiddlewareContext,
    next: NextFn,
  ) => {
    let value: number|string = await next();
    const length = value.toString().length;
    if(process.env.DEMO_MODE != null && value != null && length > 4) {
        value = `${value.toString().substring(0, length - 3)}xxxx`;
    }
    return value;
  };