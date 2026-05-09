// import { PrismaClient } from '@prisma/client';

// export async function seedDefaultWallet(prisma: PrismaClient) {
//   // Check if default wallet already exists
//   const existingWallet = await prisma.wallet.findFirst();

//   if (!existingWallet) {
//     // Create default wallet with zero balance
//     await prisma.wallet.create({
//       data: {
//         //balance: 0,

//       },
//     });
//     console.log('✅ Default wallet created successfully');
//   } else {
//     console.log('ℹ️ Default wallet already exists');
//   }
// }
