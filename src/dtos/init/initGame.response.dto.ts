import { ResponseDataDto } from '../response.data.dto';
import { Locales } from '../types';

import { ConstantsDto } from './constants.dto';
import { ExtendedConfigDto } from './extendedConfig.dto';

export interface InitGameResponseDto extends ResponseDataDto {
  constants: ConstantsDto;
  extendedConfig: ExtendedConfigDto;
  leaderboard_server_selection_data: {
    [key in Locales]: {
      server_ids: string[]; // ["all_en_WO", "int1", "int2"]
    };
  };
}
