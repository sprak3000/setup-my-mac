# Tips

> [!NOTE]
> Tips on various ways to port over the miscellany -- configuration files, etc. -- for various applications.

## JetBrains

- **Scratches:** `~/Library/Application Support/JetBrains/WebStormXXXX/scratches`
- **Database consoles:** `~/Library/Application Support/JetBrains/WebStormXXXX/consoles/db`
  - This is every console for every project you have
  - Need to find individaul workspace file and copy over references appropriately
    - Find old workspace file
    - Find new workspace file
    - Copy consoles based on UUIDs from old to new
    - Update workspace files as needed, look for item / presentation nodes in XML
 
 ## FireFox

 - Copy over open tabs, groups, etc.
   - Close FireFox on both machines
   - Copy `~/Library/Application Support/Firefox/Profiles/[profile-name]/sessionstore.jsonlz4` from source machine to destination machine
   - Move file into profile on destination machine
   - Restart FireFox on destination machine (will wipe any existing tabs you had there)
