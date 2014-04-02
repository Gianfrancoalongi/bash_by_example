#!/bin/bash
VAR='teatralic tea tastes tremendously'
echo '${VAR}='${VAR}
echo '${VAR#tea}='${VAR#tea}
echo '${VAR#teatralic}='${VAR#teatralic}
echo '${VAR%ly}='${VAR%ly}
echo '${VAR%tremendously}='${VAR%tremendously}
