import { writeFileSync } from 'fs';
import { join } from 'path';
import axios from 'axios';
import { js as beautify } from 'js-beautify';

import config from '../libs/config';

axios.get(config.getAssetUrl('mainJs'))
  .then(({ data }: { data: string }) => {
    const betterData = beautify(data, {
      indent_size: 2,
      space_in_empty_paren: true,
    });

    writeFileSync(join(__dirname, '..', 'data', 'BBE.js'), betterData);

    const version = data.match(config.versionRegExp);

    console.log(`Version: ${version[1]}`);
  })
  .catch((error) => console.error(error));
