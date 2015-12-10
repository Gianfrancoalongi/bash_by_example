#!/bin/bash
VAR='teatralic tea tastes tremendously'
echo '${VAR}='${VAR}
echo '${VAR#tea}='${VAR#tea}
echo '${VAR#tea* }='${VAR#tea* }
echo '${VAR%ly}='${VAR%ly}
echo '${VAR% *y}='${VAR% *y}
