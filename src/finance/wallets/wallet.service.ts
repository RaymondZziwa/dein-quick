import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { GenericResponse } from 'src/utils/genericResponse';

@Injectable()
export class WalletService {
  constructor(private readonly prismaService: PrismaService) {}

  async create(data: {
    channelId: string;
    name: string;
    purpose?: string;
  }): Promise<GenericResponse> {
    const branch = await this.prismaService.wallet.create({ data });
    return {
      status: 200,
      data: branch,
      message: 'Wallet created successfully',
    };
  }

  async findAll(): Promise<GenericResponse> {
    const wallets = await this.prismaService.wallet.findMany();
    return {
      status: 200,
      data: wallets,
      message: 'Wallets fetched successfully',
    };
  }

  async update(
    id: string,
    data: { name?: string; location?: string },
  ): Promise<GenericResponse> {
    const wallet = await this.prismaService.wallet.update({
      where: { id },
      data,
    });
    return {
      status: 200,
      data: wallet,
      message: 'Wallet modified successfully',
    };
  }

  async remove(id: string): Promise<GenericResponse> {
    const wallet = await this.prismaService.wallet.delete({ where: { id } });
    return {
      status: 200,
      data: wallet,
      message: 'Wallet deleted successfully',
    };
  }
}
