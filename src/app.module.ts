import { Module } from '@nestjs/common';
import { OrganizationModule } from './organization/organization.module';
import { UserModule } from './user';

@Module({
  imports: [OrganizationModule, UserModule],
})
export class AppModule {}
