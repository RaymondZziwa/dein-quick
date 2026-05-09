import { IsString, IsOptional, IsUUID } from 'class-validator';

export class CreateWalletDto {
  @IsUUID()
  channelId: string;

  @IsString()
  name: string;

  @IsString()
  @IsOptional()
  purpose?: string;
}
