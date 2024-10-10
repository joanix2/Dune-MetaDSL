export class Role {
    public readonly id: string;  // L'ID est en lecture seule

    public readonly name: string;  // Le nom du rôle est en lecture seule pour tout le monde

    constructor(id: string, name: string) {
        this.id = id;
        this.name = name;
    }
}
