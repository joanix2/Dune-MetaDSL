import { Role } from './Role';

export class User {
    public readonly id: string;  // ID en lecture seule

    public name: string;  // Visible et modifiable par l'utilisateur

    public readonly email: string;  // Email est en lecture seule pour tout le monde, seul admin peut lire

    public password: string;  // Utilisateurs authentifiés peuvent créer et mettre à jour

    public role: Role;  // Relation many-to-one avec Role

    constructor(id: string, name: string, email: string, password: string, role: Role) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.role = role;
    }
}
