﻿Add-ADGroupMember -Identity 'new' -Members (Get-ADGroupMember -Identity 'old' -Recursive)