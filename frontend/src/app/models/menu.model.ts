export interface Menu {
    id: number;
    ten: string;
    link: string;
    trangThai: number;
    idCha: number;
    tenMenuCha: string;
    children: Menu[];
}