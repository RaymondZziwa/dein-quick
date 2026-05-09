import { IsString, IsOptional, IsUUID } from 'class-validator';
import { PartialType } from '@nestjs/mapped-types';
import { CreateWalletDto } from './create-wallet.dto';

export class UpdateWalletDto extends PartialType(CreateWalletDto) {
  @IsUUID()
  @IsOptional()
  channelId?: string;

  @IsString()
  @IsOptional()
  name?: string;

  @IsString()
  @IsOptional()
  purpose?: string;
}
