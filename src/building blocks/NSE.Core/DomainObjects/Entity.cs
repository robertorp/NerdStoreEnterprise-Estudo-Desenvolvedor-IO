using System;
using System.Collections.Generic;

namespace NSE.Core.DomainObjects
{
    public abstract class Entity : IComparable<Entity>
    {
        public Guid Id { get; set; }

        protected bool Equals(Entity other)
        {
            return Id.Equals(other.Id);
        }

        public override string ToString()
        {
            return $"{GetType().Name} [Id={Id}]";
        }

        public override bool Equals(object obj)
        {
            if (ReferenceEquals(null, obj)) return false;
            if (ReferenceEquals(this, obj)) return true;
            if (obj.GetType() != this.GetType()) return false;
            return Equals((Entity) obj);
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }

        private sealed class IdEqualityComparer : IEqualityComparer<Entity>
        {
            public bool Equals(Entity x, Entity y)
            {
                if (ReferenceEquals(x, y)) return true;
                if (ReferenceEquals(x, null)) return false;
                if (ReferenceEquals(y, null)) return false;
                if (x.GetType() != y.GetType()) return false;
                return x.Id.Equals(y.Id);
            }

            public int GetHashCode(Entity obj)
            {
                return obj.Id.GetHashCode();
            }
        }

        public static IEqualityComparer<Entity> IdComparer { get; } = new IdEqualityComparer();

        public int CompareTo(Entity other)
        {
            if (ReferenceEquals(this, other)) return 0;
            if (ReferenceEquals(null, other)) return 1;
            return Id.CompareTo(other.Id);
        }

        private sealed class IdRelationalComparer : IComparer<Entity>
        {
            public int Compare(Entity x, Entity y)
            {
                if (ReferenceEquals(x, y)) return 0;
                if (ReferenceEquals(null, y)) return 1;
                if (ReferenceEquals(null, x)) return -1;
                return x.Id.CompareTo(y.Id);
            }
        }

        public static bool operator ==(Entity a, Entity b)
        {
            if (ReferenceEquals(a, null) && ReferenceEquals(b, null))
                return true;

            if (ReferenceEquals(a, null) || ReferenceEquals(b, null))
                return false;

            return a.Equals(b);
        }

        public static bool operator !=(Entity a, Entity b)
        {
            return !(a == b);
        }
    }
}