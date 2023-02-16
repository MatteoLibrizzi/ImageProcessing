function stretched = stretched(i)
    stretched = uint8(i);
    stretched = stretched - min(stretched(:));
    stretched = stretched / max(stretched(:));

    stretched = uint8(stretched*255);
end