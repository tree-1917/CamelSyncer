# CamelSyncer Project 

> Objective 

create a project that will be a centerlize location to store our docfile for
project and can sync between more than remote location ... 

> Modeling 

```mermaid 
classDiagram 
    class CamelSyncer ~Main Class~ {
        +String vault_name
        +Pointer vault_path 
        +list() 
        +clean()
    }

    class Docfile {
        +String docfile_name 
        +Pointer docfile_path
        +create_docfile 
        +delete_docfile
        +update_docfile
    }

    %% relationship %% 
    CamelSyncer "1" o-- "*" Docfile : Manage 


    %% notes %% 

    note for Docfile "will store this in way "docfile/docfile" to make a
    deletion in o(1) and use inode for linux systme
