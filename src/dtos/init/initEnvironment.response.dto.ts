import { ResponseDataDto } from '../response.data.dto';

import { ExtendedConfigDto } from './extendedConfig.dto';

export interface InitEnvironmentResponseDto extends ResponseDataDto {
  data: {
    extendedConfig: ExtendedConfigDto;
    textures: {};
    version_check: string; // "ok"
  };
}
